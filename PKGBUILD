# Maintainer: KUMAX <kumax2048@pm.me>

_pkgname=xlibinput_calibrator
pkgname=xlibinput-calibrator
pkgrel=1
pkgver=0.10
pkgdesc="Touch calibrator for libinput."
url="https://github.com/kreijack/xlibinput_calibrator"
makedepends=("libxi" "libx11" "gcc" "txt2man")
optdepends=("xrandr")
license=('unknown')
provides=("${pkgname}")
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    make all
}

package() {
   cd ${srcdir}/${_pkgname}-${pkgver}
   make DESTDIR="${pkgdir}/" install 
}
