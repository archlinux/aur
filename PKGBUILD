# Maintainer: w568w <w568w at outlook dot com>

_pkgname='zvm'
pkgname="$_pkgname-bin"
pkgver='0.8.13'
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
sha256sums_x86_64=('d1407c42847f0b34ff72671dedc96780673bab199ab21b58c09c6842edaa7110')
sha256sums_aarch64=('de3ac05d419195c43bc6693de9b6231f1c7a5b9373a6ad69cab72f7839670e35')
sha256sums_loong64=('6d2714d8a4324ebc9212d6276fe47cb37fdf490902f8ff9e0509c3379703b2d1')
sha256sums_powerpc64le=('c4aca6c39e8abf2881b1be58f6851aade813d802e69cfa51aac73a313f5f3d7e')

package() {  
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 zvm.bash "$pkgdir/usr/bin/zvm"
  install -Dm755 zvm -t "$pkgdir/usr/lib/$_pkgname/self"
}

