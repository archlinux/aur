# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mpd-notification
pkgver=0.8.5
pkgrel=1
pkgdesc='Notify about tracks played by mpd'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mpd-notification'
depends=('libsystemd' 'ffmpeg' 'file' 'iniparser' 'libnotify' 'libmpdclient')
makedepends=('systemd' 'markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('d9b4871e2f5db7c52217cd31d71b03009e0796c5b9e27f84ec53af46578b82e5'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

