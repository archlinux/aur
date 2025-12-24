# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=rumdl-bin
pkgver=0.0.200
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

sha256sums_x86_64=('6b04f8c05358466d35498c833ff6ae212a15ebc5e1130de8c24425d7fbeb6570'
                   '51a926c9f592e10424a056d50863abd3e3ea6c0eb5941cfdcb30d8fa8e911bbe'
                   '531eee1345aea0b92d0b2cb7c3994b233dffe9d738ed1d2a6ae3cddf49b3d773')
sha256sums_aarch64=('30c75b2678a41d70409a5cc46485dcc1aee7714257460214cf3b0f8702e28393'
                    'aa7b454e583ac4e660823bea5db578a00378a7365b364851d59489b2da3abe6a'
                    '531eee1345aea0b92d0b2cb7c3994b233dffe9d738ed1d2a6ae3cddf49b3d773')


package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
