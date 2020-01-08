# Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>

_npmname=gitlab-ci-lint
_npmver=1.0.2
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=2
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
sha512sums=('26935f23b70f5a7cc6b836fd3153523ef1d0e4875c22bac0453f0740b97f8b86ef3c5318793d814478c1d914f1cd95ae9ffc1e6093120abcbbeba3e19b2cffc9')
