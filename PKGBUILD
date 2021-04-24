
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid
pkgver=1.6.1
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://git.omarpolo.com/gmid'
license=('MIT')
depends=('libressl')
source=("$url/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('7a2637feae5a44624338d267d5609adb6c685de885bb1f4cd5ae29678213012c')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" BINDIR='usr/bin/' MANDIR='usr/man/' install
}
