# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=xdman-bin
pkgver=9.0.8
pkgrel=2
pkgdesc="Xtreme Download Manager Download accelerator and video downloader"
arch=('x86_64')
url="https://github.com/subhra74/xdm"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'freetype2' 'gtk3' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst')
provides=("xdman")
conflicts=("xdman")
source=("$url/releases/download/$pkgver/xdm-app-$pkgver-1.x86_64.rpm")
sha256sums=('e3d10a14e62ff0fe15d76b85a24cff6c44b547dba3b6ffaa28922ffa6c2270da')

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
