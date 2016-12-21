# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=paccache
pkgver=0.1.25
pkgrel=1
pkgdesc='serve pacman cache and redirect via avahi service'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/paccache'
depends=('libsystemd' 'avahi' 'curl' 'iniparser' 'darkhttpd' 'libmicrohttpd' 'nss-mdns')
makedepends=('systemd' 'markdown')
license=('GPL')
# this is not to blame pacserve from AUR but to replace my old
# package that was named the same
conflicts=('pacserve')
replaces=('pacserve')
install=paccache.install
backup=('etc/pacredir.conf' 'etc/pacman.d/paccache')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('821c200a4da55bd617587fd0b0d9d33836c6ea3216269665a11773cf056b305c'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

