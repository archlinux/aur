# Maintainer: MuntasirSZN <muntasir.joypurhat@gmail.com>
pkgname=getquotes
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple command-line tool to fetch random quotes (pre-built binary)."
arch=('x86_64')
url="https://github.com/MuntasirSZN/getquotes"
license=('MIT')
source=(
  "https://github.com/MuntasirSZN/getquotes/releases/download/v${pkgver}/getquotes-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('c5c6d647840cad40e1fa3b92e0523ab644d9dd22f1966954e7e5b8d3061e8078')

package() {
  cd "$srcdir"
  # Extract the tar.gz file
  tar -xzf getquotes-x86_64-unknown-linux-gnu.tar.gz

  # Install the binary
  install -Dm755 getquotes-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/getquotes"

  # Install the LICENSE file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install the manpage
  install -Dm644 man/getquotes.1 "$pkgdir/usr/share/man/man1/getquotes.1"
}
