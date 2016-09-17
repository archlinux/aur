# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Chromaryu <knight.ryu12@gmail.com>
pkgname=libxmp-git
pkgver=4.4.0
pkgrel=1
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=('i686' 'x86_64')
url="http://xmp.sourceforge.net/"
license=('GPL')
depends=('glibc' 'git')
optdepends=('pulseaudio')
conflicts=('libxmp')
provides=('libxmp')
source=("$pkgname"::"git+https://github.com/cmatsuoka/libxmp.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	autoconf
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
