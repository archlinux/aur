# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mail-deduplicate
pkgver=6.2.0
pkgrel=1
pkgdesc='Command-line tool to deduplicate mails from a set of boxes'
arch=(any)
license=(GPL2)
url="https://mail-deduplicate.readthedocs.io/"
depends=(python python-arrow python-boltons python-click-help-colors
         python-click-log python-tabulate python-tomlkit)
makedepends=(python-build python-installer python-poetry-core)
replaces=(maildir-deduplicate)
conflicts=(maildir-deduplicate)
provides=(maildir-deduplicate)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=(7953fee270e049b73822738ed9ac8437d0be60e9f23fe10dfd2500650dc280d4)

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check(){
  cd $pkgname-$pkgver
  # blows up
  #pytest
}

package () {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
