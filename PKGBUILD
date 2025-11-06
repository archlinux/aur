# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mpd-notification
pkgver=0.9.3
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
license=('GPL-3.0-or-later')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('d3ca7398feb79c7ed45cca8a8f4671a400b286d9ca3a1cf94278a127dcc3f0e4'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make VERSION="${pkgver}-${pkgrel}"
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

