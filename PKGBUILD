# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mpd-notification
pkgver=0.6.0
pkgrel=2
pkgdesc='Notify about tracks played by mpd'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mpd-notification'
depends=('ffmpeg' 'libnotify' 'libmpdclient' 'gnome-icon-theme')
makedepends=('markdown')
license=('GPL')
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

sha256sums=('bcf443fa4a2ea525e63c2ff2f285be66fae0ee7c7032d5be9922410ba1a93477'
            'SKIP')
