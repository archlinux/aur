# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mpd-notification
pkgver=0.7.5
pkgrel=1
pkgdesc='Notify about tracks played by mpd'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mpd-notification'
depends=('ffmpeg' 'libnotify' 'libmpdclient' 'gnome-icon-theme')
makedepends=('markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('b928d0e459b4bde6025ddd61edcab78d2c9867be50a45c2efc6900a8515bf753'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

