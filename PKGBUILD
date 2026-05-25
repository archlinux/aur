# Maintainer: w568w <w568w at outlook dot com>

_pkgname='zvm'
pkgname="$_pkgname-bin"
pkgver='0.8.22'
pkgrel='1'
pkgdesc='Version manager for Zig compilers (binary version)'
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64' 'aarch64' 'loong64' 'powerpc64le')
url='https://github.com/tristanisham/zvm'
license=('MIT')
source=(
  "LICENSE::$url/raw/refs/heads/master/LICENSE"
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

sha256sums=('6149c9a360f7fcde722b0d3c54a129737d10142857b26d1aaf1a5ec9737bb459'
            '08cd47b1b748b3b5a6b29bd012a9d09bbd70717180debe7edcf2a2d230b2089d'
            '66da3559a9c3083f4e9dcbc288891974dac57bc4c2ed27bd4d434131ca6f65d2')
sha256sums_x86_64=('d7120b24b401ff5cf5ebb66449513389a1137c52d062a00fbf9b44940bd3bb12')
sha256sums_aarch64=('94c92e8f79f04aedcfe17f6251cf1c755a6f0a9f5891f027f738c16c9ea38b7b')
sha256sums_loong64=('7546d23e5fdc9b2ec5c0afe8c401fc7066bc4fda909e270f750dc5cdd3a7bcd8')
sha256sums_powerpc64le=('ebfdd4855ad731fed5499e8890c778201eaf58cbe36dfc1cac9804b62871ca43')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 zvm.bash "$pkgdir/usr/bin/zvm"
  install -Dm755 zvm -t "$pkgdir/usr/lib/$_pkgname/self"
}
