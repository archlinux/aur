# Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>

_npmname=gitlab-ci-lint
_npmver=1.1.0
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="GitLab CI/CD cli to lint .gitlab-ci.yml files"
arch=('any')
url="https://github.com/BuBuaBu/gitlab-ci-lint"
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
  chmod -R 755 $_npmdir$_npmname

}
sha512sums=('ef1f5ca1cd67cfc1908bed3f338855188dfc1e513c44fe6414a577090dec7da35cd1d38c82e9bb13833064cde269510a2d3f9c25c674b331c8c11d1d1f885f5e')
