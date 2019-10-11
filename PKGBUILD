# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=system76-oled
pkgver=0.1.3
pkgrel=2
pkgdesc="Control brightness on System76 OLED displays"
arch=('x86_64')
url="https://github.com/pop-os/system76-oled"
license=('GPL3')
depends=('dbus' 'libx11' 'libxrandr')
makedepends=('rust')
source=("https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('af99b853c309bae06114aa3a49ab86a31db44d55b5e074d8a560854150d60f9d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
	make clean prefix=/usr
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir/" install prefix=/usr
}

