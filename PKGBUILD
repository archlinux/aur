# Contributor: Aloxaf <aloxafx@gmail.com>
# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=bkcrack-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Crack legacy zip encryption with Biham and Kocher's known plaintext attack."
arch=('x86_64')
url="https://github.com/kimci86/bkcrack"
license=('ZLIB')
depends=('gcc-libs' python glibc)
provides=("bkcrack")
conflicts=("bkcrack")
source=("https://github.com/kimci86/bkcrack/releases/download/v$pkgver/bkcrack-$pkgver-Linux.tar.gz")
sha256sums=('39b149dcc24375d47a8767448ebb98f2d664d837a23bddc6a4edc1c94340efd1')

package() {
	install -vd "$pkgdir/usr/share/bkcrack"
	cp -av ./*/* "$pkgdir/usr/share/bkcrack"
	install -vDm755 "$pkgdir/usr/share/bkcrack/bkcrack" -t "$pkgdir/usr/bin/"
	install -vDm644 "$pkgdir/usr/share/bkcrack/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
	rm -v "$pkgdir/usr/share/bkcrack/bkcrack" "$pkgdir/usr/share/bkcrack/license.txt"
}
