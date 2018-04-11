# Maintainer: Hanspeter Porner <dev@open-music-kontrllers.ch>
pkgname=spectmorph
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="a free software project which allows to analyze samples of musical instruments, and to combine them (morphing)."
arch=(i686 x86_64 armv7h)
url="http://spectmorph.org/"
license=('LGPL3')
groups=('lv2-plugins')
depends=('fftw' 'libao' 'jack' 'python2' 'cairo' 'libgl')
makedepends=('lv2')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://spectmorph.org/downloads/$pkgname-$pkgver.tar.bz2")
noextract=()
md5sums=('331dd8f61f799d33752a757a3eb8adc4')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure \
		--prefix=/usr \
		--with-lv2 \
		--with-jack \
		--without-beast \
		--without-qt
	make
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
