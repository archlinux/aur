# Maintainer: w568w <w568w at outlook dot com>

_pkgname='zvm'
pkgname="$_pkgname-bin"
pkgver='0.8.12'
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
sha256sums_x86_64=('56162f8cac745489762393272130c2ea0d26efe021d3aa9827aa7482f0c7bf2c')
sha256sums_aarch64=('fc46b2b0cd71829f3ba9a4bf228d503da3debe0cbc0fbc792d871cf3566405ed')
sha256sums_loongarch64=('c28a2c357e75ce3eb1fff7c270992c292e5557cef3eb757dc7c7b4c6a77b9cdf')
sha256sums_ppc64le=('c2869b09b200c990f6d85ad924d6da386dc7cb058986c0a2aeafd98174715b0d')

package() {  
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 zvm.bash "$pkgdir/usr/bin/zvm"
  install -Dm755 zvm -t "$pkgdir/usr/lib/$_pkgname/self"
}

