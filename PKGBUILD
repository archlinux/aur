# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mpd-notification
pkgver=0.8.3
pkgrel=1
pkgdesc='Notify about tracks played by mpd'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mpd-notification'
depends=('libsystemd' 'ffmpeg' 'file' 'iniparser' 'libnotify' 'libmpdclient' 'gnome-icon-theme')
makedepends=('systemd' 'markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('3f757da543404c5dfce1d36c8808efc468aed1055cfe07c65b5ef844e994a020'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

