# Maintainer: éclairevoyant

pkgname=sunwait
pkgver=0.9.1
pkgrel=1
url="https://www.risacher.org/sunwait/"
pkgdesc="A small C program for calculating sunrise and sunset times"
arch=(i686 x86_64)
license=(GPL3)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/risacher/sunwait/archive/refs/tags/$pkgver.tar.gz")
b2sums=('e623a4d0d05f09ae52671679d84ea6700f667f7629d80873930a36596dd19a9215e4fa62f107172d9e70614077059be6d864d01476651f6c18afa172f64f767d')

prepare() {
	# respect CFLAGS, LDFLAGS
	sed -i 's/FLAGS=/FLAGS+=/g' $pkgname-$pkgver/makefile
}

build() {
	make -C $pkgname-$pkgver
}

package() {
	install -Dm755 $pkgname-$pkgver/$pkgname -t "$pkgdir/usr/bin/"
}
