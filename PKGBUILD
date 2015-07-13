# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=netlink-notify
pkgver=0.7.3
pkgrel=1
pkgdesc='Notify about netlink changes'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/netlink-notify'
depends=('libnotify')
makedepends=('markdown')
license=('GPL')
install=netlink-notify.install
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('8491e26c67ea9a501a883b7a3d7b7bc8d779532a522ded22a89550e5072b3fa4'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

