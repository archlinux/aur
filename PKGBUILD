# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=rmux-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Universal Rust multiplexer with a typed SDK'
arch=('x86_64')
url=https://github.com/Helvesec/rmux
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=('MIT')
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
  "LICENSE_$pkgver::$_rawurl/LICENSE-MIT"
	$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu.tar.gz
)

sha256sums=('4c74b225bda6a74411aea9ad5ada3ff7a2bff25658de9c58bcc81da7062070b0'
            '6f34b90d93e7155783109a2c6cc83807086808a4681a1025d0502e38d2fc2acb')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
