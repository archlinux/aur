# Maintainer: xifan2333 <xifan233@163.com>
pkgname=dmnotifier-bin
pkgver=1.0.6
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

sha256sums_x86_64=('f2375f6dca6e53ec8f8dbd00ce39c3b3b0356a7f39a58393b46926ff799d8134')
sha256sums_aarch64=('97e148cbc2066b1874f8ac5e4d80edc0b3b7a0af153521e6d8a76fb618f26bba')

package() {
  if [[ $CARCH == "x86_64" ]]; then
    install -Dm755 "$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/dmnotifier"
  elif [[ $CARCH == "aarch64" ]]; then
    install -Dm755 "$pkgname-$pkgver-aarch64" "$pkgdir/usr/bin/dmnotifier"
  fi
}
