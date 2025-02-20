# Maintainer: MuntasirSZN <muntasir.joypurhat@gmail.com>
pkgname=getquotes
pkgver=0.3.5
pkgrel=1
pkgdesc="A simple command-line tool to fetch random quotes (pre-built binary)."
arch=('x86_64' 'aarch64')
url="https://github.com/MuntasirSZN/getquotes"
license=('MIT')
source_x86_64=("https://github.com/MuntasirSZN/getquotes/releases/download/v${pkgver}/getquotes-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/MuntasirSZN/getquotes/releases/download/v${pkgver}/getquotes-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('47aae21eaef2d699b9f0cdcae441e947b6ba0ab4128205c25f577b2ab40a4bf8')
sha256sums_aarch64=('b9e022e064e3d3c031d8f7304d2811975a9d5285a688d83d534c6223177a2a39')
conflicts=('getquotes-git')

package() {
	cd "$srcdir"

	# Extract the appropriate tar.gz file based on architecture
	if [[ "$CARCH" == "x86_64" ]]; then
		tar -xzf getquotes-x86_64-unknown-linux-gnu.tar.gz
	else
		tar -xzf getquotes-aarch64-unknown-linux-gnu.tar.gz
	fi

	# Install the binary
	install -Dm755 getquotes "$pkgdir/usr/bin/getquotes"
	# Install the LICENSE file
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Install the manpage
	install -Dm644 man/getquotes.1 "$pkgdir/usr/share/man/man1/getquotes.1"
}
