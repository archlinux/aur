# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=applyppf
pkgver=3.0
pkgrel=2
pkgdesc="PPF (Playstation Patch File) v3.0 apply tool"
url="http://ftp.netbsd.org/pub/pkgsrc/current/pkgsrc/emulators/applyppf/DESCR"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://ftp.netbsd.org/pub/pkgsrc/distfiles/applyppf3_src.zip)

sha256sums=('49a1be17e1c87a41a85068d23afad3860ede49e61db90d1d086ead036d63eae2')

build() {
	gcc -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -o applyppf applyppf3_linux.c
}

package() {
	install -Dm0755 applyppf "$pkgdir"/usr/bin/applyppf
}
