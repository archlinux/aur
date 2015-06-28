# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=netlink-notify
pkgver=0.7.2
pkgrel=2
pkgdesc="Notify about netlink changes"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/netlink-notify"
depends=('libnotify')
makedepends=('markdown')
license=('GPL')
install=netlink-notify.install
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

sha256sums=('a52ade374b93ca787928a06c548bf00b7e7aca40b9d9965b666a55b3ce7fea31'
            'SKIP')
