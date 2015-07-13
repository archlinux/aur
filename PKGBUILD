# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=journal-notify
pkgver=0.1.0
pkgrel=1
pkgdesc='Notify about journal log entries'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/journal-notify'
depends=('libnotify' 'systemd' 'gnome-icon-theme')
makedepends=('markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('797386ea71f44e3709420fd5241499570c021a966e947146bbbe7f0d95440914'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

