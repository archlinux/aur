# Maintainer: MuntasirSZN <muntasir.joypurhat@gmail.com>
pkgname=getquotes
pkgver=0.3.7
pkgrel=1
pkgdesc="A simple command-line tool to fetch random quotes (pre-built binary)."
arch=('x86_64' 'aarch64')
url="https://github.com/MuntasirSZN/getquotes"
license=('MIT')
source_x86_64=("https://github.com/MuntasirSZN/getquotes/releases/download/v${pkgver}/getquotes-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/MuntasirSZN/getquotes/releases/download/v${pkgver}/getquotes-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('167a8e5c7db8058c1b9bb0e7c765077885ad3c7f3394c4625aac827d600bc629')
sha256sums_aarch64=('eeda68ee04a1ca848c7600ff37ac23a5dbd26bf64cd0084c18d6e57ebd90cd22')
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
