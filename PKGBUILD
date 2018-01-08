# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udp514-journal
pkgver=0.0.1
pkgrel=1
pkgdesc='forward syslog from network (udp/514) to systemd-journald'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/udp514-journal'
depends=('systemd')
makedepends=('markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('c2a8bc9b267eafebf0e66a987470f23cd4888aa31a7d6756fa874759bb3be51a'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

