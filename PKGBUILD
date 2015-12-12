# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=paccache
pkgver=0.1.16
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
sha256sums=('a1b28bfedd05448d600259c52b7a8075df2229e3a3db76b6949ef708bd6afdea'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

