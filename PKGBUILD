# Maintainer: w568w <w568w at outlook dot com>

_pkgname='zvm'
pkgname="$_pkgname-bin"
pkgver='0.8.10'
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
sha256sums_x86_64=('904e2e9898f3465cbdebb70542e985e749d109f7f5b740a85c7b9891290f66d9')
sha256sums_aarch64=('e0edb2e505e9cfad7f725696236d48f098f8860329e9dc8e1705d8e5bfa5824c')
sha256sums_loongarch64=('75378f1f0bc2fb3984f02ce8f22cfd6353ebeb66b5e758c36b66186bb26d7734')
sha256sums_ppc64le=('c015532e1c68109df87102af82c0f098ed653c8480d8bd02389628c5a2855d57')

package() {  
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 zvm.bash "$pkgdir/usr/bin/zvm"
  install -Dm755 zvm -t "$pkgdir/usr/lib/$_pkgname/self"
}

