# Maintainer: w568w <w568w at outlook dot com>

_pkgname='zvm'
pkgname="$_pkgname-bin"
pkgver='0.9.5'
pkgrel='2'
pkgdesc='Version manager for Zig compilers (binary version)'
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64' 'aarch64' 'loong64' 'powerpc64le')
url='https://github.com/tristanisham/zvm'
license=('MIT')
source=(
  "LICENSE-$pkgver::$url/raw/refs/tags/v$pkgver/LICENSE"
  "zvm.bash"
  "path.install"
)
depends=('bash')
install=path.install
source_x86_64=(
  "$pkgname-$pkgver-x86_64.tar::$url/releases/download/v$pkgver/zvm-linux-amd64.tar"
)
source_aarch64=(
  "$pkgname-$pkgver-aarch64.tar::$url/releases/download/v$pkgver/zvm-linux-arm64.tar"
)
source_loong64=(
  "$pkgname-$pkgver-loong64.tar::$url/releases/download/v$pkgver/zvm-linux-loong64.tar"
)
source_powerpc64le=(
  "$pkgname-$pkgver-powerpc64le.tar::$url/releases/download/v$pkgver/zvm-linux-ppc64le.tar"
)

sha256sums=('0749f1e161cdf25dde3de06d35610453dbf94fc24a60e13e8c5cd7b3f460c277'
            '08cd47b1b748b3b5a6b29bd012a9d09bbd70717180debe7edcf2a2d230b2089d'
            '66da3559a9c3083f4e9dcbc288891974dac57bc4c2ed27bd4d434131ca6f65d2')
sha256sums_x86_64=('6816dbb67db44e90c8ed733c4f3ed9454d694eb4cbb5e46d790383891e7851eb')
sha256sums_aarch64=('a5c8fa8511e13a631681d269cb58331efc8d69e3d06220f151d3b5f080ceed26')
sha256sums_loong64=('0d43ef76efd666869c4c50cfc5d5276a388f3c040fd50e4bdb856c6a9e9ea21e')
sha256sums_powerpc64le=('cddc2450da1f9a0345b303df2611482fe862fd4e7bde262a234b29e5cb2a8faf')

package() {
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 zvm.bash "$pkgdir/usr/bin/zvm"
  install -Dm755 zvm -t "$pkgdir/usr/lib/$_pkgname/self"
}
