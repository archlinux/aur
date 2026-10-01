# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xr-hardware
pkgver=1.1.2
pkgrel=1
pkgdesc='Udev rules for accessing XR (VR and AR) hardware devices'
arch=('any')
url='https://gitlab.freedesktop.org/monado/utilities/xr-hardware/'
license=('BSL-1.0')
makedepends=('python')
provides=('oculus-udev' 'osvr-udev' 'psvr-udev' 'vive-udev')
source=("https://gitlab.freedesktop.org/monado/utilities/xr-hardware/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a34ac31bf73c1c3265f0c94f1b9b4854450dcefd51f6ca662f1b52286e4900bb')

build() {
    make -C "${pkgname}-${pkgver}" clean_package all
}

check() {
    make -C "${pkgname}-${pkgver}" test
}

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" PREFIX='/usr' install_package
}
