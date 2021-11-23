# Maintainer : eggz
pkgname=stillalive
pkgver=1
gitver=n${pkgver}
pkgrel=2
pkgdesc='Log into GLaDOS to see the "still alive" message in realtime!'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('GPL3')
depends=(
    'mplayer'
    'yt-dlp'
    'bash'
)
provides=('stillalive.sh')
source=("stillalive.sh")
sha256sums=('57bf2c77373b473456ab5eb87dfdc1cc861b3897808473cdb5050916692dbc3a')

prepare() {
	echo "GLaDOS booting up ..."
	sleep 1
}

build() {
	cd ${srcdir}
	mkdir -p usr/bin/
	mkdir -p var/cache/stillalive/
	cp stillalive.sh usr/bin/.
}

package() {
	mkdir -p ../pkg/$pkgbase/usr/bin/
	mkdir -p ../pkg/$pkgbase/var/cache/stillalive/
	chmod 777 ../pkg/$pkgbase/var/cache/stillalive/
	cp usr/bin/stillalive.sh ../pkg/$pkgbase/usr/bin/
	chmod 755 ../pkg/$pkgbase/usr/bin/stillalive.sh
}
