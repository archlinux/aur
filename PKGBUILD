# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udev-block-notify
pkgver=0.7.10
pkgrel=1
pkgdesc='Notify about udev block events'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/udev-block-notify'
depends=('libsystemd' 'libnotify' 'udev' 'gnome-icon-theme' 'gnome-icon-theme-extras')
makedepends=('systemd' 'markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('eb2831b6d90204bb9968197ac688a4b692be9922785fb407a2def28612b10bbe'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

