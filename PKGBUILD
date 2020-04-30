# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=system76-oled
pkgver=0.1.4
pkgrel=1
pkgdesc="Control brightness on System76 OLED displays"
arch=('x86_64')
url="https://github.com/pop-os/system76-oled"
license=('GPL3')
depends=('dbus' 'libx11' 'libxrandr')
makedepends=('rust')
source=("https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('14bd774108a91780af1cb85bc15089d28d8bd8c3dbe5c6d2eba1b41791ce1f16')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
	make clean prefix=/usr
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir/" install prefix=/usr
}

