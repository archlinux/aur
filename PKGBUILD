# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=journal-notify
pkgver=0.1.2
pkgrel=2
pkgdesc='Notify about journal log entries'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/journal-notify'
depends=('libnotify' 'systemd')
optdepends=('gnome-icon-theme: icons in notifications')
makedepends=('discount')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('bc780e0388472b5fc650cbf9911f02adf025f1b05aa20cac2fb02ef4c5fe3566'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

