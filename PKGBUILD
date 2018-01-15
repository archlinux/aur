# Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>

_npmname=gitlab-letsencrypt
_npmver=3.0.0
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Easily generate a Let's Encrypt certificate for GitLab.com hosted pages"
arch=('any')
url="https://github.com/rolodato/gitlab-letsencrypt"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
provides=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" $_npmname@$_npmver
  chmod 755 $_npmdir$_npmname
}
md5sums=('f074690c2ceacbd4e88ad2a37dfe0fa7')
