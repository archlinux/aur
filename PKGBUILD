# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=rumdl-bin
pkgver=0.0.213
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

sha256sums_x86_64=('f308f0615866c1bb2c1d5c5b1042a8b0d0801fceddf9ba213344db9390ca0611'
                   '89e0e906d15f0fa3e94bce622afc6bd82a813ca45107da554c3c39d809de0f0e'
                   '531eee1345aea0b92d0b2cb7c3994b233dffe9d738ed1d2a6ae3cddf49b3d773')
sha256sums_aarch64=('1260d988ac17d9514d9e0b437c207f96c5e701e3cbd4743ef06461ac0437eb44'
                    '0d396d78429c9070ea9d5bec9efa2eb6d5df7781b56898f240d68b1c0c1adb10'
                    '531eee1345aea0b92d0b2cb7c3994b233dffe9d738ed1d2a6ae3cddf49b3d773')


package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
