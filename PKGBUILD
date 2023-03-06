# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-rgb-sdk
pkgname=${_pkgname}-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Customize colors on Wooting Keyboard #WootDev"
arch=('x86_64')
url="https://github.com/WootingKb/$_pkgname"
license=('MPL2')
depends=('libusb')
makedepends=('git' 'hidapi' 'libusb')
provides=("libwooting-rgb-sdk" $_pkgname)
conflicts=("libwooting-rgb-sdk")
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-ubuntu-x64.zip")
sha512sums=("c3748ca2626c6e2925f87281c06eb6f1cc6f62fc47b683b913d712953b09825a75d347e53f67868192d303e60ba09c9c5fc05f2c68808ae90e60f60e4868f46f")

package() {
  install -Dm755 libwooting-rgb-sdk.so ${pkgdir}/usr/lib/libwooting-rgb-sdk.so
	install -Dm644 libwooting-rgb-sdk.pc ${pkgdir}/usr/lib/pkgconfig/libwooting-rgb-sdk.pc
	install -Dm644 wooting-rgb-sdk.h ${pkgdir}/usr/include/wooting-rgb-sdk.h
	install -Dm644 wooting-usb.h ${pkgdir}/usr/include/wooting-usb.h
}
