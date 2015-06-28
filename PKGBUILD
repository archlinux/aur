# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=journal-notify
pkgver=0.0.8
pkgrel=2
pkgdesc='Notify about journal log entries'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/journal-notify'
depends=('libnotify' 'systemd' 'gnome-icon-theme')
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

sha256sums=('a03cb460921ee6530929406c50e823ee6fab703b663433d038e91195d627f927'
            'SKIP')
