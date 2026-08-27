# Maintainer: w568w <w568w at outlook dot com>

_pkgname='zvm'
pkgname="$_pkgname-bin"
pkgver='0.9.1'
pkgrel='1'
pkgdesc='Version manager for Zig compilers (binary version)'
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64' 'aarch64' 'loong64' 'powerpc64le')
url='https://github.com/tristanisham/zvm'
license=('MIT')
source=(
  "LICENSE::$url/raw/refs/tags/v$pkgver/LICENSE"
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
sha256sums_x86_64=('9d4bf04c7f5099ca32bf6b939421096a5961753db2d0ed04a3c53c3975f12974')
sha256sums_aarch64=('7e3950bb75b98759a40aafd9bc5105eb7e4770056d8588e3777560e3b75d9b20')
sha256sums_loong64=('5bae953625b168d2c2eb6157008916ac3d6086ac77f0235412a3e0ee9dbae05f')
sha256sums_powerpc64le=('ed4cb5ea0dfbf2ab2106210187b3b5ed8f4d40a89c172ecc4e5f6bba065e1212')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 zvm.bash "$pkgdir/usr/bin/zvm"
  install -Dm755 zvm -t "$pkgdir/usr/lib/$_pkgname/self"
}
