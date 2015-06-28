# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udev-block-notify
pkgver=0.7.7
pkgrel=2
pkgdesc="Notify about udev block events"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/udev-block-notify"
depends=('libnotify' 'udev' 'gnome-icon-theme' 'gnome-icon-theme-extras')
makedepends=('markdown')
license=('GPL')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

sha256sums=('48a51dd3cc6bd951f8fbf2b8c33a21b7b8c6e0af979eca07310077a0284a4887'
            'SKIP')
