# Maintainer: ntsk <ntsk@ntsk.jp>
pkgname=fad-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Upload, download, and install APK/AAB releases on Firebase App Distribution"
arch=('x86_64' 'aarch64')
url="https://github.com/ntsk/fad"
license=('MIT')
provides=('fad')
conflicts=('fad')
source_x86_64=("fad-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/fad-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("fad-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/fad-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3a6f13fd6439024314c51a496cc38e2a0b7c278bf680d1fab17c86159766b0e3')
sha256sums_aarch64=('ccdafcb5532d69632dba19f55321452b47dc40f0b652b10ca8923cb3eadb6e24')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-gnu" ;;
    aarch64) triple="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "fad-v$pkgver-$triple/fad" "$pkgdir/usr/bin/fad"
  install -Dm644 "fad-v$pkgver-$triple/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
