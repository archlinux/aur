# Maintainer: ntsk <ntsk@ntsk.jp>
pkgname=fad-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Upload, download, and install APK/AAB releases on Firebase App Distribution"
arch=('x86_64' 'aarch64')
url="https://github.com/ntsk/fad"
license=('MIT')
provides=('fad')
conflicts=('fad')
source_x86_64=("fad-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/fad-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("fad-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/fad-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('04f80077ad27e77bbe75a3cbe4110af1fb9c110c4bc109d2b6fb08defdaabba7')
sha256sums_aarch64=('705be4d4f7fd4182610c0cd4f3bbeec843dd7752b9b72de3b4a142ea081d736d')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-gnu" ;;
    aarch64) triple="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "fad-v$pkgver-$triple/fad" "$pkgdir/usr/bin/fad"
  install -Dm644 "fad-v$pkgver-$triple/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
