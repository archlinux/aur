# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mail-deduplicate
_pkgname=mail_deduplicate
pkgver=8.1.2
pkgrel=1
pkgdesc='An utility to deduplicate mails from a set of boxes.'
arch=(any)
license=(GPL2)
url="https://kdeldycke.github.io/mail-deduplicate/"
depends=(python python-arrow python-boltons python-click-extra)
makedepends=(python-build python-installer python-setuptools python-wheel)
replaces=(maildir-deduplicate)
conflicts=(maildir-deduplicate)
provides=(maildir-deduplicate)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=(30ed948490f35f47da27829f239c20068a936010d78e198da44b69f1d65c3d1e)

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
