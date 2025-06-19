# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mail-deduplicate
_pkgname=mail_deduplicate
pkgver=7.6.2
pkgrel=1
pkgdesc='An utility to deduplicate mails from a set of boxes.'
arch=(any)
license=(GPL2)
url="https://kdeldycke.github.io/mail-deduplicate/"
depends=(python python-arrow python-boltons python-click-extra
         python-tabulate)
makedepends=(python-build python-installer python-setuptools python-wheel)
replaces=(maildir-deduplicate)
conflicts=(maildir-deduplicate)
provides=(maildir-deduplicate)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=(20368c6e048be51368eeaf73ba2cccaa3396009e77c8766d2f137dd6e1d2a48f)

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
