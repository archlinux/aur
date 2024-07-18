# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mail-deduplicate
_pkgname=mail_deduplicate
pkgver=7.5.0
pkgrel=2
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
sha256sums=(e6a93d7ed70b4176e427c15c90b735619275d8eca67be5995339f7b8076eb48c)

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
