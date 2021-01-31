# Maintainer: gardar <aur@gardar.net>

pkgname=cramfs-tools
pkgver=2.1
pkgrel=1
pkgdesc="Cramfs - cram a filesystem onto a small ROM"
url="https://github.com/npitre/$pkgname"
arch=('i686' 'x86_64')
license=('GPL')
depends=('zlib')
options=('!strip' '!emptydirs')
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('cdb7a4ecad034f063b6456b37cdf653ae31758a224c32161e54712a9d7f01cc3')

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname-$pkgver/README" "$pkgdir/usr/share/man/man1/cramfsck.1"
	install -Dm644 "$srcdir/$pkgname-$pkgver/README" "$pkgdir/usr/share/man/man1/mkcramfs.1"
	install -Dm755 "$srcdir/$pkgname-$pkgver/cramfsck" "$pkgdir/usr/bin/cramfsck"
	install -Dm755 "$srcdir/$pkgname-$pkgver/mkcramfs" "$pkgdir/usr/bin/mkcramfs"
}
