# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=netlink-notify
pkgver=0.8.2
pkgrel=1
pkgdesc='Notify about netlink changes'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/netlink-notify'
depends=('libsystemd' 'libnotify')
makedepends=('systemd' 'discount')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('e74d4467885fb1201f19575d7ca7ac320f74ebf11a9f210e381dabc99a59aa69'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make VERSION="${pkgver}-${pkgrel}"
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

