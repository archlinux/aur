# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mpd-notification
pkgver=0.9.1
pkgrel=1
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
sha256sums=('0f078bd6c5339f4a8a54e164c32afae244ec78d44d6f0881d5bacc0014a4ddec'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

