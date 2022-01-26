# Maintainer: Nathaniel Cook <nvcook42@gmail.com>
pkgname=rzip
pkgver=2.1
pkgrel=2
epoch=
pkgdesc="rzip is a compression program, similar in functionality to gzip or bzip2, but able to take advantage long distance redundencies in files, which can sometimes allow rzip to produce much better compression ratios than other programs."
arch=('x86_64')
url="https://rzip.samba.org/"
license=('GPL2')
depends=('bzip2')
source=("https://rzip.samba.org/ftp/rzip/$pkgname-$pkgver.tar.gz")
sha256sums=('4bb96f4d58ccf16749ed3f836957ce97dbcff3e3ee5fd50266229a48f89815b7')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
    make clean
	make
}

package() {
	cd "$pkgname-$pkgver"
    install -D -m 755 rzip $pkgdir/usr/bin/rzip
    install -D -m 644 rzip.1 $pkgdir/usr/share/man/man1/rzip.1
}

