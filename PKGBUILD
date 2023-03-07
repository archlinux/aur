# Maintainer: Antony Jordan <antony.r.jorda at gmail dot com>
pkgname=nanovna-saver
pkgver=0.5.5
pkgrel=1
pkgdesc="PC control for the NanoVNA."
arch=(any)
url="https://github.com/NanoVNA-Saver/nanovna-saver"
license=('GPL3')
depends=(python-pyqt5 python-scipy python-numpy python-pyserial qt5-base)
makedepends=(python-setuptools)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/NanoVNA-Saver/nanovna-saver/archive/v$pkgver.tar.gz"
)
sha256sums=('1f872fb33a0d64e9290b4dcf50c57298f879268276ed385ae22477943e283296')

build() {
    cd "$pkgname-$pkgver"
    python ./setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python ./setup.py install --prefix=/usr --root="$pkgdir"
}
