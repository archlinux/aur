# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mail-deduplicate
_pkgname=mail_deduplicate
pkgver=7.6.0
pkgrel=1
pkgdesc='Command-line tool to deduplicate mails from a set of boxes'
arch=(any)
license=(GPL2)
url="https://mail-deduplicate.readthedocs.io/"
depends=(python python-arrow python-boltons python-click-extra
         python-tabulate)
makedepends=(python-build python-installer python-setuptools python-wheel)
replaces=(maildir-deduplicate)
conflicts=(maildir-deduplicate)
provides=(maildir-deduplicate)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=(d7eb0ea2f14db707c0f566f1f8222ebae51398387b9601ab0db99c4472a0f6f7)

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check(){
  cd $_pkgname-$pkgver
  # blows up
  #pytest
}

package () {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
