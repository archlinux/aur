# Maintainer: ntsk <ntsk@ntsk.jp>
pkgname=fad-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Upload, download, and install APK/AAB releases on Firebase App Distribution"
arch=('x86_64' 'aarch64')
url="https://github.com/ntsk/fad"
license=('MIT')
provides=('fad')
conflicts=('fad')
source_x86_64=("fad-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/fad-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("fad-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/fad-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e093bd28b50e2212a18a82274781cd5884c1ac75fc372137fb8015f0faf480e1')
sha256sums_aarch64=('16f17a00183e5f55dc071cc81b7e34d74d80465c418d9de1ce623f9f812e6307')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-gnu" ;;
    aarch64) triple="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "fad-v$pkgver-$triple/fad" "$pkgdir/usr/bin/fad"
  install -Dm644 "fad-v$pkgver-$triple/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
