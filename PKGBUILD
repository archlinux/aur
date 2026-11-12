# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=xdman-bin
pkgver=9.0.9
pkgrel=1
pkgdesc="Xtreme Download Manager Download accelerator and video downloader"
arch=('x86_64')
url="https://github.com/subhra74/xdm"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'freetype2' 'gtk3' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst')
provides=("xdman")
conflicts=("xdman")
source=("$url/releases/download/$pkgver/xdm-app-$pkgver-1.x86_64.rpm")
sha256sums=('081db9ce608dc2ccab93b19a3a8ec913881f3ea50fec31f2bde2899b16bde509')

package() {
  mv opt "$pkgdir"
  cd usr/share
  for i in 16 24 32 48 64 128 256 512; do
    install -Dm644 icons/hicolor/${i}x${i}/apps/xdm-app.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
  done
  install -Dm644 applications/xdm-app.desktop -t "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/xdm-app/bin/xdm-app "$pkgdir/usr/bin/xdm-app"
  ln -s xdm-app "$pkgdir/usr/bin/xdman"
}
