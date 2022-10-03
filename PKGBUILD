# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xr-hardware
pkgver=1.1.0
pkgrel=1
pkgdesc='Udev rules for accessing XR (VR and AR) hardware devices'
arch=('any')
url='https://gitlab.freedesktop.org/monado/utilities/xr-hardware/'
license=('Boost')
makedepends=('git' 'python' 'python-attrs')
checkdepends=('flake8')
provides=('oculus-udev' 'osvr-udev' 'psvr-udev' 'vive-udev')
source=('git+https://gitlab.freedesktop.org/monado/utilities/xr-hardware.git#commit=8618eed28a3401ae1c657cb6cddfb1ff67155e80')
sha256sums=('SKIP')

build() {
    make -C xr-hardware clean_package all
}

check() {
    make -C xr-hardware test
}

package() {    
    make -C xr-hardware DESTDIR="$pkgdir" PREFIX='/usr' install_package
}
