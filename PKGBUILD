# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Aloxaf <aloxafx@gmail.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>

pkgname=bkcrack-bin
pkgver=1.8.1
pkgrel=1
pkgdesc="Crack legacy zip encryption with Biham and Kocher's known plaintext attack."
arch=('x86_64')
url="https://github.com/kimci86/bkcrack"
license=('Zlib')
depends=('gcc-libs' python glibc)
provides=("bkcrack")
conflicts=("bkcrack")
source=("https://github.com/kimci86/bkcrack/releases/download/v$pkgver/bkcrack-$pkgver-Linux-$arch.tar.gz")
sha256sums=('45dc7d81adbaaad5c0aa2d8615ea920fd08b732fda1ea945504e0a3e8dc1d2ab')

package() {
	install -vd "$pkgdir/usr/share/bkcrack"
	cp -av ./*/* "$pkgdir/usr/share/bkcrack"
	install -vDm755 "$pkgdir/usr/share/bkcrack/bkcrack" -t "$pkgdir/usr/bin/"
	install -vDm644 "$pkgdir/usr/share/bkcrack/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
	rm -v "$pkgdir/usr/share/bkcrack/bkcrack" "$pkgdir/usr/share/bkcrack/license.txt"
}
