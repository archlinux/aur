# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pacredir
pkgver=0.2.1
pkgrel=1
pkgdesc='redirect pacman requests, assisted by avahi service discovery'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/pacredir'
depends=('libsystemd' 'avahi' 'curl' 'iniparser' 'darkhttpd' 'libmicrohttpd')
makedepends=('systemd' 'markdown')
license=('GPL')
conflicts=('paccache')
replaces=('paccache')
install=pacredir.install
backup=('etc/pacredir.conf' 'etc/pacman.d/pacredir')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183') # Christian Hesse <mail@eworm.de>
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('2ad71397860cb413ef3a5606f48b18d9b372de6b1448f9fb9f9ca8f8073554e8'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

