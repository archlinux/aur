# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udev-block-notify
pkgver=0.7.11
pkgrel=2
pkgdesc='Notify about udev block events'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/udev-block-notify'
depends=('libsystemd' 'libnotify' 'udev' 'gnome-icon-theme-extras')
makedepends=('systemd' 'discount')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('d121922cce54af69f5bbe4c5a065079530a86d9c16170b9ba396e1d59e425ab1'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

