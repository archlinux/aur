# Maintainer: xifan2333 <xifan233@163.com>
pkgname=dmnotifier-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="跨平台弹幕通知客户端，基于 UniBarrage (binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/dmnotifier"
license=('MIT')
depends=('mpv')
provides=('dmnotifier')
conflicts=('dmnotifier')

source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/xifan2333/dmnotifier/releases/download/v$pkgver/dmnotifier-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/xifan2333/dmnotifier/releases/download/v$pkgver/dmnotifier-linux-arm64")

sha256sums_x86_64=('f932c86388295b51458abddaee2b0ce9a47c418a41b920dbd725c4697ba1a79f')
sha256sums_aarch64=('a3ae704d80e602b23133aa5cb4cc13685abfda79a38169b220793002a2b9fdc0')

package() {
  if [[ $CARCH == "x86_64" ]]; then
    install -Dm755 "$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/dmnotifier"
  elif [[ $CARCH == "aarch64" ]]; then
    install -Dm755 "$pkgname-$pkgver-aarch64" "$pkgdir/usr/bin/dmnotifier"
  fi
}
