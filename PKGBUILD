# Maintainer: Antony Jordan <antony.r.jorda at gmail dot com>
pkgname=nanovna-saver
pkgver=0.6.3
pkgrel=1
pkgdesc="PC control for the NanoVNA."
arch=(any)
url="https://github.com/NanoVNA-Saver/nanovna-saver"
license=('GPL3')
depends=(python-pyqt6 python-scipy python-numpy python-pyserial qt5-base python-setuptools-scm)
makedepends=(python-setuptools)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/NanoVNA-Saver/nanovna-saver/archive/v$pkgver.tar.gz"
)
sha256sums=('a5354df26d867270727cd7db91b65da84e533a8ef358dbbada98714f0a1d6071')

build() {
    cd "$pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION_FOR_NANOVNASAVER="${pkgver}" \
      python ./setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION_FOR_NANOVNASAVER="${pkgver}" \
      python ./setup.py install --prefix=/usr --root="$pkgdir"
}
