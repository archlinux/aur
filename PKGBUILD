# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=git-statuses-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='A command-line tool to display the status of multiple Git repositories.'
arch=('x86_64')
options=(!lto)
url=https://github.com/bircni/git-statuses
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/$pkgver"
license=('MIT')
depends=(glibc gcc-libs libgit2)
makedepends=(cargo)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
  $pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-musl.tar.gz
  "LICENSE_$pkgver::$_rawurl/LICENSE"
)

sha256sums=('bd82e6116ed80397942da47370fdd08b7d084bd805863c2970f423e1197237a2'
            'cbe4e9b21763ba9a7cb13d61ca20026d7b8f1a92b9257d76b579639f44793e1a')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
