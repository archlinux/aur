# Maintainer: zebdo <zebdo[4t]posteo[d0t]ee>
pkgname=epyrus-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Open source email client based on Thundermail"
arch=('x86_64')
url="http://www.epyrus.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('libxt'
    'desktop-file-utils')
provides=(epyrus=$pkgver)
conflicts=(epyrus)
options=(!strip)
source=(epyrus.desktop)
source_x86_64=("https://www.addons.epyrus.org/download/epyrus-${pkgver}.linux-x86_64-gtk3.tar.xz")
sha256sums=('5dccd55e7d032be0b9929a44b92bc7aa98ccaf6c68ee40c0580ed5010c4d00e9')
sha256sums_x86_64=('d5f578e556fb0372e75d8b9e6c2e129fbd62026e05fcb2b5d896566051b14d76')

package() {
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r epyrus/ "$pkgdir/usr/lib/epyrus"
  ln -s ../lib/epyrus/epyrus "$pkgdir/usr/bin/epyrus"
  install -Dm644 epyrus.desktop "$pkgdir/usr/share/applications/epyrus.desktop"

  # icons
  install -Dm644 epyrus/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/epyrus.png"
  install -Dm644 epyrus/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/epyrus.png"
  install -Dm644 epyrus/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/epyrus.png"
  install -Dm644 epyrus/chrome/icons/default/default256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/epyrus.png"
}
