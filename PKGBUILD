# Maintainer: ntsk <ntsk@ntsk.jp>
pkgname=fad-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Upload, download, and install APK/AAB releases on Firebase App Distribution"
arch=('x86_64' 'aarch64')
url="https://github.com/ntsk/fad"
license=('MIT')
provides=('fad')
conflicts=('fad')
source_x86_64=("fad-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/fad-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("fad-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/fad-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('28370356f4d1959be145159490acbe53f1bfcc3ca49874255215831132676f27')
sha256sums_aarch64=('c68a5597b74729f1e355e5e48d1b3680ca88d050f0eeabaaf0ee8cc47be80d18')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-gnu" ;;
    aarch64) triple="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "fad-v$pkgver-$triple/fad" "$pkgdir/usr/bin/fad"
  install -Dm644 "fad-v$pkgver-$triple/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
