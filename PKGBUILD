# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xr-hardware
pkgver=1.1.1
pkgrel=1
pkgdesc='Udev rules for accessing XR (VR and AR) hardware devices'
arch=('any')
url='https://gitlab.freedesktop.org/monado/utilities/xr-hardware/'
license=('BSL-1.0')
makedepends=('python')
provides=('oculus-udev' 'osvr-udev' 'psvr-udev' 'vive-udev')
source=("https://gitlab.freedesktop.org/monado/utilities/xr-hardware/-/archive/1.1.1/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a177f8e608b71a0cd645b35fc103bfa84878fbcc155d7b36d9ddfa3d4f0a5b23')

build() {
    make -C "${pkgname}-${pkgver}" clean_package all
}

check() {
    make -C "${pkgname}-${pkgver}" test
}

package() {    
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" PREFIX='/usr' install_package
}
