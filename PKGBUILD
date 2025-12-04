# Maintainer: w568w <w568w at outlook dot com>

_pkgname='zvm'
pkgname="$_pkgname-bin"
pkgver='0.8.11'
pkgrel='1'
pkgdesc='Version manager for Zig compilers (binary version)'
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64' 'aarch64' 'loongarch64' 'ppc64le')
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
source_loongarch64=(
  "$pkgname-$pkgver-loongarch64.tar::$url/releases/download/v$pkgver/zvm-linux-loong64.tar"
)
source_ppc64le=(
  "$pkgname-$pkgver-ppc64le.tar::$url/releases/download/v$pkgver/zvm-linux-ppc64le.tar"
)

sha256sums=('6149c9a360f7fcde722b0d3c54a129737d10142857b26d1aaf1a5ec9737bb459'
            '08cd47b1b748b3b5a6b29bd012a9d09bbd70717180debe7edcf2a2d230b2089d'
            '66da3559a9c3083f4e9dcbc288891974dac57bc4c2ed27bd4d434131ca6f65d2')
sha256sums_x86_64=('0cc09239d0d14f72d8c4507129543a09879b8f40712ba1b34d50801a10b111d0')
sha256sums_aarch64=('4db60c66112f95dfeedaa3627ad6fa17d74ff64c7bb9487d9d51bed01384a72f')
sha256sums_loongarch64=('2da0e5c10701951ed39c0800e963b3dd66a6fa93abedc8e53d810694eb25128b')
sha256sums_ppc64le=('cb1d577a5482994bab5969798023e65f527fe618d0183eda812429dbddd44a35')

package() {  
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 zvm.bash "$pkgdir/usr/bin/zvm"
  install -Dm755 zvm -t "$pkgdir/usr/lib/$_pkgname/self"
}

