# Maintainer: ntsk <ntsk@ntsk.jp>
pkgname=fad-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Upload, download, and install APK/AAB releases on Firebase App Distribution"
arch=('x86_64' 'aarch64')
url="https://github.com/ntsk/fad"
license=('MIT')
provides=('fad')
conflicts=('fad')
source_x86_64=("fad-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/fad-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("fad-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/fad-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ab9c14d7048dfaa55af830ae008c7de310e5f5f481881aa149c90dd02fb96adc')
sha256sums_aarch64=('75d47477ff777a3ff369f01daea0211083b0c551f6d45beb3b10ef749d665092')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-gnu" ;;
    aarch64) triple="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "fad-v$pkgver-$triple/fad" "$pkgdir/usr/bin/fad"
  install -Dm644 "fad-v$pkgver-$triple/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
