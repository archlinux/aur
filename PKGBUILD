# Maintainer: valvetime <valvetimepackages@gmail.com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=soapyrtlsdr-git
pkgver=20151225
pkgrel=1
pkgdesc="SoapySDR RTL-SDR Support Module"
arch=('any')
url="https://github.com/pothosware/SoapySDR"
license=('MIT')
depends=('soapysdr-git' 'rtl-sdr')
makedepends=('git')
source=(${pkgname}::"git+https://github.com/pothosware/SoapyRTLSDR.git")
sha256sums=('SKIP')


build() {
        cd "${srcdir}/${pkgname}"
        mkdir -p build
        cd build
        cmake .. -DCMAKE_BUILD_TYPE=Release
        make -j4
}

package() {
        make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install
}

