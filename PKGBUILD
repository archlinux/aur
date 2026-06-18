# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=rmux-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Universal Rust multiplexer with a typed SDK'
arch=('x86_64')
url=https://github.com/Helvesec/rmux
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=('MIT')
depends=(glibc libgcc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
	$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-x86_64.tar.gz
)

sha256sums=('d726f60b838b51d5911fe747655abd00d5a048e0c07c3e71350f23aaac12d273')

package() {
  cd "${pkgname%-bin}-$pkgver-linux-x86_64"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "share/man/man1/${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm0755 "bin/${pkgname%-bin}" -t "$pkgdir/usr/bin/"
}
