# Maintainer: xifan2333 <xifan233@163.com>
pkgname=dmnotifier-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="跨平台弹幕通知客户端，基于 UniBarrage (binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan23332333/dmnotifier"
license=('MIT')
depends=('mpv')
provides=('dmnotifier')
conflicts=('dmnotifier')

source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/xifan23332333/dmnotifier/releases/download/v$pkgver/dmnotifier-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/xifan23332333/dmnotifier/releases/download/v$pkgver/dmnotifier-linux-arm64")

sha256sums_x86_64=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')
sha256sums_aarch64=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
  if [[ $CARCH == "x86_64" ]]; then
    install -Dm755 "$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/dmnotifier"
  elif [[ $CARCH == "aarch64" ]]; then
    install -Dm755 "$pkgname-$pkgver-aarch64" "$pkgdir/usr/bin/dmnotifier"
  fi
}
