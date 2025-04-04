# Maintainer: w568w <w568w at outlook dot com>

_pkgname='zvm'
pkgname="$_pkgname-bin"
pkgver='0.8.6'
pkgrel='2'
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
sha256sums_x86_64=('26523066e1b8f06266671dae52dae210c743d2c5d115a09e880957294bc91e8f')
sha256sums_aarch64=('a0f8530a0787cee047a8f38f54ecf941f20f91fe771e3558df3533d56cb3e03a')
sha256sums_loongarch64=('37c0df82b91255c7e6209a143a7b026767a485be95ac0a7c16d482ac5cd27a78')
sha256sums_ppc64le=('a4d94aae76176126ea2fd098623fe971d8a023d22cac8910d66ae892198c0671')

package() {  
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 zvm.bash "$pkgdir/usr/bin/zvm"
  install -Dm755 zvm -t "$pkgdir/usr/lib/$_pkgname/self"
}

