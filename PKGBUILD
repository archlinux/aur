# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-rgb-sdk
pkgname=${_pkgname}-bin
pkgver=1.5.2
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
sha512sums=("8b9fa8c0277c32c9dbb7801e0859061ed6887dd89659d84848f8ce071ee6a77c351c943f390b2befb8b362695a39badd405fc2531f147a904073d4af276b658e")

package() {
  install -Dm755 libwooting-rgb-sdk.so ${pkgdir}/usr/lib/libwooting-rgb-sdk.so
	install -Dm644 libwooting-rgb-sdk.pc ${pkgdir}/usr/lib/pkgconfig/libwooting-rgb-sdk.pc
	install -Dm644 wooting-rgb-sdk.h ${pkgdir}/usr/include/wooting-rgb-sdk.h
	install -Dm644 wooting-usb.h ${pkgdir}/usr/include/wooting-usb.h
}
