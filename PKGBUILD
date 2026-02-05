# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=rumdl-bin
pkgver=0.1.13
pkgrel=1
pkgdesc='Markdown Linter and Formatter written in Rust'
arch=('x86_64' 'aarch64')
url=https://github.com/rvben/rumdl
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=('MIT')
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
  "LICENSE_$pkgver::$_rawurl/LICENSE"
)
source_aarch64=(
	$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-aarch64-unknown-linux-gnu.tar.gz
	$pkgname-$pkgver-aarch64.tar.gz.sha256::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-aarch64-unknown-linux-gnu.tar.gz.sha256
)
source_x86_64=(
	$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu.tar.gz
	$pkgname-$pkgver-x86_64.tar.gz.sha256::$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu.tar.gz.sha256
)

sha256sums=('531eee1345aea0b92d0b2cb7c3994b233dffe9d738ed1d2a6ae3cddf49b3d773')
sha256sums_x86_64=('8ca392975038d8e9d10ec56adc28fe31bea6bdcf959d04c46c76b5f56f7b3e8c'
                   '955328cc73effdccb5a259afb225c23b344a8b1fc2dd1cd96664e460ddf225b6')
sha256sums_aarch64=('d82d5bec42e5970b74972f49a9ac2fde724e74e1ab8bb711a3f4679861bb3cd6'
                    'ce7744410dcd5e6996d9a86cfe2feb5e919c258ac6fc9ef231a93a07f917175a')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
