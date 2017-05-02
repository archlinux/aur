# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pacredir
pkgver=0.2.2
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
sha256sums=('d00d9cc7b9c2b93a1813a97cced00b3b502dc6db4cac5346e3afa1e7464e1e7c'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

