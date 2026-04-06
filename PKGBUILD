# Maintainer: karasevuy <eganov2006@gmail.com>
pkgname=wrain-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="GPU accelerated rain wallpaper for Wayland (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/happyzxzxz/wrain"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'vulkan-icd-loader' 'alsa-lib' 'xkeyboard-config')
provides=('wrain')
conflicts=('wrain' 'wrain-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/wrain-x86_64.tar.gz")
sha256sums=('04c0460b098687551633797cf4c92a6ae9c6be75c6a17284fadf557d46abea04')

package() {
  install -Dm755 "wrain" "$pkgdir/usr/bin/wrain"
  install -d "$pkgdir/usr/share/wrain/assets"
  cp -r assets/* "$pkgdir/usr/share/wrain/assets/"
}
