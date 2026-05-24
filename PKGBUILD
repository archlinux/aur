# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=rmux-bin
pkgver=0.3.0
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
	$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu.tar.gz
)

sha256sums=('03a5ac706381baffc56d96ccff0b50e9837e94bfe61862d28e98f4003281bef8')

package() {
  cd "${pkgname%-bin}-v$pkgver"*
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}/"
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
