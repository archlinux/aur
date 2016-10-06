# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=paccache
pkgver=0.1.21
pkgrel=1
pkgdesc='serve pacman cache and redirect via avahi service'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/paccache'
depends=('avahi' 'curl' 'iniparser' 'darkhttpd' 'libmicrohttpd' 'nss-mdns')
makedepends=('markdown')
license=('GPL')
# this is not to blame pacserve from AUR but to replace my old
# package that was named the same
conflicts=('pacserve')
replaces=('pacserve')
install=paccache.install
backup=('etc/pacredir.conf' 'etc/pacman.d/paccache')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('15e5bef1d4ed02021ab28133b2e24666c6f424604aadc52f27c6e12aa5894b46'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

