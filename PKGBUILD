# Maintainer: nibo <nibo aett relim d0t de>

pkgname=cho2txt
pkgver=1.0
pkgrel=1
pkgdesc="Extract lyrics from chordpro files"
arch=('x86_64')
url="https://github.com/devnibo/cho2txt"
license=('ISC')
source=("https://github.com/devnibo/$pkgname/releases/download/v$pkgver/"$pkgname"_v"$pkgver".tar.xz")
b2sums=("7ffa480bfebc3a365a400691bc46b775b0188a3b5f2c9645aeae835fa8caa1394b356885c1343213f353a0581410b8e7d18cade803f4d1ec3cfef3753e8d7b4f")

build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	make PREFIX="$pkgdir/usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
