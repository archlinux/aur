# Maintainer : eggz
pkgname=stillalive
pkgver=1
gitver=n${pkgver}
pkgrel=1
pkgdesc='Log into GLaDOS to see the "still alive" message in realtime!'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('GPL3')
depends=(
    'mplayer'
    'youtube-dl'
    'bash'
)
provides=('stillalive.sh')
source=("stillalive.sh")
sha256sums=('ea98b0e4554f4ddc384845db60c53332b95b3f87ddd678236138b99f400c7e41')

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
