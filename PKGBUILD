# Maintainer: karasevuy <eganov2006@gmail.com>
pkgname=wrain-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="GPU accelerated rain wallpaper for Wayland (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/happyzxzxz/wrain"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'vulkan-loader' 'alsa-lib')
provides=('wrain')
conflicts=('wrain' 'wrain-git')
source=("${url}/releases/download/v${pkgver}/wrain-x86_64.tar.gz")
sha256sums=('1cd4fac7a78fb3927a5613bd01236dc59f86ed18bf1b1d306b48b2c87f547b9d')

package() {
  install -Dm755 "wrain" "$pkgdir/usr/bin/wrain"
  
  install -d "$pkgdir/usr/share/wrain/assets"
  cp -r assets/* "$pkgdir/usr/share/wrain/assets/"
}
