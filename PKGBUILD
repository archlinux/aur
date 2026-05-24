# Maintainer: w568w <w568w at outlook dot com>

_pkgname='zvm'
pkgname="$_pkgname-bin"
pkgver='0.8.21'
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
sha256sums_x86_64=('10f791bbb4ab034bd9333c34f40f3f0fa9f62cd62a48cb0c37c16aa8a8681569')
sha256sums_aarch64=('c49cae6f1c76f59cb5f121692263b30868ac0cfae4b6a40a2420f9e1456758d2')
sha256sums_loong64=('76c69a1d5d9d6b00bb8cc4901b27dc8f4879c2ea2b25e91a7e194db04c48634c')
sha256sums_powerpc64le=('16a74436129d7fa5e6605d8cba337fab7690c037e022dd802691ac6554061346')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 zvm.bash "$pkgdir/usr/bin/zvm"
  install -Dm755 zvm -t "$pkgdir/usr/lib/$_pkgname/self"
}
