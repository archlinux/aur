# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-rgb-sdk
pkgname=${_pkgname}-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Customize colors on Wooting Keyboard #WootDev"
arch=('x86_64')
url="https://github.com/WootingKb/$_pkgname"
license=('MPL2')
depends=('libusb')
makedepends=('git' 'hidapi' 'libusb')
provides=("libwooting-rgb-sdk" $_pkgname)
conflicts=("libwooting-rgb-sdk")
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x64.zip")
sha512sums=("4f768a04057f7b9ba66715e93236ea0de2f7836eea0c9ad9b9578e40dc72ff7b08155c886199f92973cfee5b5ae3b9334c2ce4da8f36d1ba133d642cdcd96fee")

package() {
    install -Dm755 libwooting-rgb-sdk.so ${pkgdir}/usr/lib/libwooting-rgb-sdk.so
	install -Dm644 libwooting-rgb-sdk.pc ${pkgdir}/usr/lib/pkgconfig/libwooting-rgb-sdk.pc
	install -Dm644 wooting-rgb-sdk.h ${pkgdir}/usr/include/wooting-rgb-sdk.h
	install -Dm644 wooting-usb.h ${pkgdir}/usr/include/wooting-usb.h
}
