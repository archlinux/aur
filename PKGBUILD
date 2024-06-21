# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mpd-notification
pkgver=0.9.0
pkgrel=2
pkgdesc='Notify about tracks played by mpd'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mpd-notification'
depends=('libsystemd' 'libsystemd.so'
         'ffmpeg' 'libavformat.so' 'libavutil.so'
         'file' 'libmagic.so'
         'iniparser' 'libiniparser.so'
         'libnotify' 'libnotify.so'
         'libmpdclient' 'libmpdclient.so')
makedepends=('systemd' 'discount')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('40ff3d52d5341b1337c68fcb32ebc7d04a02cbe76221b6f08e452278b88c94ea'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

