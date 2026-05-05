# Maintainer: Liam Barrack <liam@liambarrack.com>
pkgname=leetui-bin
_pkgname=leetui
pkgver=0.0.4
pkgrel=1
pkgdesc="A terminal UI for browsing and solving LeetCode problems (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/lbarto12/leetui"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-linux-amd64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-linux-arm64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('dcf0e80e024e6951bae3ceb77babe1e35d5902b62d245218203c3838623da925')
sha256sums_aarch64=('980114650f52b14dc1c5f660cd92598513ea17f55052e514acbd74c7b493884f')

package() {
  case "$CARCH" in
    x86_64)  _arch="amd64" ;;
    aarch64) _arch="arm64" ;;
  esac

  cd "$_pkgname-$pkgver-linux-$_arch"
  install -Dm755 "$_pkgname"  "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE      "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md    "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
