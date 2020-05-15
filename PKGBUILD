# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=openrgb
pkgver=0.2
pkgrel=1
pkgdesc="Open source RGB lighting control that doesn't depend on manufacturer software"
arch=("x86_64")
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL2')
depends=('qt5-base' 'libusb')
optdepends=('linux-openrgb: ASUS and ASRock motherboard support')
provides=("openrgb")
source=("https://gitlab.com/CalcProgrammer1/OpenRGB/-/archive/release_$pkgver/OpenRGB-release_$pkgver.tar.gz")
md5sums=('aba82b83744b04d5fe1728aea85b5a62')

build() {
	cd "OpenRGB-release_$pkgver"
    qmake OpenRGB.pro
    make
}

package() {
    install -Dm755 "$srcdir/OpenRGB-release_$pkgver/OpenRGB" "$pkgdir"/usr/bin/OpenRGB
}
