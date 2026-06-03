# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=rmux-bin
pkgver=0.4.3
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

sha256sums=('f0580b4f0c138010210201b2b2dc738c3782da75261e696e07e832b7ba1c7532')

package() {
  cd "${pkgname%-bin}-$pkgver-linux-x86_64"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "share/man/man1/${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm0755 "bin/${pkgname%-bin}" -t "$pkgdir/usr/bin/"
}
