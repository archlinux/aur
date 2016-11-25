# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=morgenlichtctl
pkgver=0.1.2
pkgrel=2
pkgdesc='A simple client for morgenlichtd, written in C.'
arch=('x86_64' 'x86' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://bennett.piater.name/morgenlichtctl'
license=('GPL3')

depends=('argtable' 'sdl2_net')
group=('morgenlicht')

#changelog="CHANGELOG"
source=("https://github.com/clawoflight/morgenlichtctl/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('4f86dee2e75fa1ce462d4004ad29146a')
validpgpkeys=('871F10477DB3DDED5FC447B226C7E577EF967808')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
