# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-rgb-sdk
pkgname=${_pkgname}-bin
pkgver=1.4.0
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
sha512sums=("c42e48b0b9f7f5512d5ed35d14822b747d620d66b180a11cb7a2e544d970ab8655909e9a1b89ff3af317f4b1eab5f34dd89ad6c2ed52a0847183516521571ed8")

package() {
    install -Dm755 libwooting-rgb-sdk.so ${pkgdir}/usr/lib/libwooting-rgb-sdk.so
	install -Dm644 libwooting-rgb-sdk.pc ${pkgdir}/usr/lib/pkgconfig/libwooting-rgb-sdk.pc
	install -Dm644 wooting-rgb-sdk.h ${pkgdir}/usr/include/wooting-rgb-sdk.h
	install -Dm644 wooting-usb.h ${pkgdir}/usr/include/wooting-usb.h
}
