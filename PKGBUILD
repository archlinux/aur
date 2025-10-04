# Maintainer: xifan2333 <xifan233@163.com>
pkgname=dmnotifier-bin
pkgver=1.0.5
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

sha256sums_x86_64=('3a44ec3bf70051a202a16795700e343f981f23e0ea57020766b94db3f0f657ea')
sha256sums_aarch64=('0a6ed6acce0627cf90efd9003eba93455542b4600c5e1c32f188de0a6059cee2')

package() {
  if [[ $CARCH == "x86_64" ]]; then
    install -Dm755 "$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/dmnotifier"
  elif [[ $CARCH == "aarch64" ]]; then
    install -Dm755 "$pkgname-$pkgver-aarch64" "$pkgdir/usr/bin/dmnotifier"
  fi
}
