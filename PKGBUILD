# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=rumdl-bin
pkgver=0.0.216
pkgrel=1
pkgdesc='Markdown Linter and Formatter written in Rust'
arch=('x86_64' 'aarch64')
url=https://github.com/rvben/rumdl
license=('MIT')
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=(
	$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-aarch64-unknown-linux-gnu.tar.gz
	$pkgname-$pkgver-aarch64.tar.gz.sha256::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-aarch64-unknown-linux-gnu.tar.gz.sha256
	LICENSE
)
source_x86_64=(
	$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu.tar.gz
	$pkgname-$pkgver-x86_64.tar.gz.sha256::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu.tar.gz.sha256
	LICENSE
)

sha256sums_x86_64=('e4b96d6e54fcfe031171563049b00a15df8456883ec4e56da18565f8969cda3a'
                   'a9fdfb3f51a515c1a29a8712f119570b1b74b271e9792331b6a7d4c9d88cf7c1'
                   '531eee1345aea0b92d0b2cb7c3994b233dffe9d738ed1d2a6ae3cddf49b3d773')
sha256sums_aarch64=('4fc199c9b2845b306da920d126eb071edd99384230af189b2ddf71b84984dbf6'
                    '1b9345310fa1f337c51e1a735f12602eaeadc5eedee13f8da7d85b7afc557dad'
                    '531eee1345aea0b92d0b2cb7c3994b233dffe9d738ed1d2a6ae3cddf49b3d773')


package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
