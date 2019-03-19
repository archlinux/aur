# Maintainer: James Wood (Chryseus) <Chryseus8080@gmail.com>

pkgname=soapysdrplay
_pkgname=SoapySDRPlay
pkgver=0.2.0
pkgrel=1
pkgdesc="SDRplay support module for SoapySDR"
arch=('x86_64')
url="https://github.com/pothosware/SoapySDRPlay"
license=('MIT')
depends=('soapysdr' 'libsdrplay')
makedepends=('cmake')
source=("https://github.com/pothosware/SoapySDRPlay/archive/soapy-sdrplay-0.2.0.tar.gz")
sha256sums=('4bf2a73827a575ecf64c8ad1b2a4d9963e78b4726426b7da95959da817719c8c')

build() {
mkdir -p "$_pkgname"-soapy-sdrplay-0.2.0/build
cd "$_pkgname"-soapy-sdrplay-0.2.0/build

cmake .. \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release
make
}

package() {
	cd "$_pkgname"-soapy-sdrplay-0.2.0/build
	make DESTDIR="$pkgdir" install
}

