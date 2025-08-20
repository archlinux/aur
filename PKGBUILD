# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Aloxaf <aloxafx@gmail.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>

pkgname=bkcrack-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Crack legacy zip encryption with Biham and Kocher's known plaintext attack."
arch=('x86_64')
url="https://github.com/kimci86/bkcrack"
license=('Zlib')
depends=('gcc-libs' python glibc)
provides=("bkcrack")
conflicts=("bkcrack")
source=("https://github.com/kimci86/bkcrack/releases/download/v$pkgver/bkcrack-$pkgver-Linux-$arch.tar.gz")
sha256sums=('774d2520ca2305e4ad5e30d59c14edba109d9cc0b6cde2d8f3ad6ebb01de13bf')

package() {
	install -vd "$pkgdir/usr/share/bkcrack"
	cp -av ./*/* "$pkgdir/usr/share/bkcrack"
	install -vDm755 "$pkgdir/usr/share/bkcrack/bkcrack" -t "$pkgdir/usr/bin/"
	install -vDm644 "$pkgdir/usr/share/bkcrack/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
	rm -v "$pkgdir/usr/share/bkcrack/bkcrack" "$pkgdir/usr/share/bkcrack/license.txt"
}
