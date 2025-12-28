# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=rumdl-bin
pkgver=0.0.205
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

sha256sums_x86_64=('a2acce0ab344f0eedee4be78ed086e458e50a6949ba7917043ad64ccc967034d'
                   '0049507d08dfdf9cd14f7b8ad5d6c70b27a8ffec2bd9e813badf51612bd1cc49'
                   '531eee1345aea0b92d0b2cb7c3994b233dffe9d738ed1d2a6ae3cddf49b3d773')
sha256sums_aarch64=('b1964a761524d73bcf296a5bad5e8e7c9771b37988b85e2289311be9dda0a30e'
                    '5bd55e8fa36aa5a2b8d4b27648b03f04b29b0f483940ecb423ffd98058ab214b'
                    '531eee1345aea0b92d0b2cb7c3994b233dffe9d738ed1d2a6ae3cddf49b3d773')


package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
