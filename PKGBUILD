# Maintainer: karasevuy <eganov2006@gmail.com>
pkgname=wrain-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="GPU accelerated rain wallpaper for Wayland (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/happyzxzxz/wrain"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'vulkan-icd-loader' 'alsa-lib')
provides=('wrain')
conflicts=('wrain' 'wrain-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/happyzxzxz/wrain/releases/download/v${pkgver}/wrain-x86_64.tar.gz")
sha256sums=('e79d3ec190d785d489555b6b44a2312de177f7b2653bd32201f6f5e2498b74d9')

package() {
  install -Dm755 "wrain" "$pkgdir/usr/bin/wrain"
  
  install -d "$pkgdir/usr/share/wrain/assets"
  cp -r assets/* "$pkgdir/usr/share/wrain/assets/"
}
