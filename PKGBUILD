# Maintainer: w568w <w568w at outlook dot com>

_pkgname='zvm'
pkgname="$_pkgname-bin"
pkgver='0.8.8'
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
sha256sums_x86_64=('a4208e375d2a6850872cd4bef4c07b0560178c4e5a32f94ebaf44d00fdabe5a9')
sha256sums_aarch64=('fd88aa7721c5a5c329eef90b855365562cac897a878a6ed3a2033abe1dcbf8a7')
sha256sums_loongarch64=('aeb34bc00aca415defef327991078eb8abc348adb049566318662cf3f5cc2436')
sha256sums_ppc64le=('f4fb1a715c57ea5a543f249dc85dd0ccf0bfb129180be71dcfbc5878f44c5534')

package() {  
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 zvm.bash "$pkgdir/usr/bin/zvm"
  install -Dm755 zvm -t "$pkgdir/usr/lib/$_pkgname/self"
}

