# Maintainer: MuntasirSZN <muntasir.joypurhat@gmail.com>
pkgname=getquotes
pkgver=0.3.4
pkgrel=1
pkgdesc="A simple command-line tool to fetch random quotes (pre-built binary)."
arch=('x86_64')
url="https://github.com/MuntasirSZN/getquotes"
license=('MIT')
source=(
	"https://github.com/MuntasirSZN/getquotes/releases/download/v${pkgver}/getquotes-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('b16842e6f1cc6ebf091a5122594e115bf46406c85a7ca8318433fe66067b4823')

package() {
	cd "$srcdir"
	# Extract the tar.gz file
	tar -xzf getquotes-x86_64-unknown-linux-gnu.tar.gz

	# Install the binary
	install -Dm755 getquotes "$pkgdir/usr/bin/getquotes"

	# Install the LICENSE file
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Install the manpage
	install -Dm644 man/getquotes.1 "$pkgdir/usr/share/man/man1/getquotes.1"
}
