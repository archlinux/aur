# Maintainer: quellen <lodgerz@gmail.com>
pkgname=epub2txt
pkgver=0.1.4
pkgrel=1
pkgdesc="Extract text from EPUB documents"
arch=('i686' 'x86_64')
url="https://github.com/kevinboone/epub2txt"
license=('GPL')
source=("https://github.com/kevinboone/epub2txt/archive/$pkgver.zip")
md5sums=('3132e2d025244c03e636622a25686bbc')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
mkdir -p "$pkgdir/usr/bin"
mkdir -p "$pkgdir/usr/share/man/man1"
cp -p "$srcdir/$pkgname-$pkgver/epub2txt" "$pkgdir/usr/bin/"
install -Dm644 "$srcdir/$pkgname-$pkgver/man1/epub2txt.1" "$pkgdir/usr/share/man/man1/"
} 
