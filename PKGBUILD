pkgname=rosary
pkgver=1.0.0
pkgrel=1
pkgdesc="A Simple Bible App Written in Qt"
arch=('x86_64' 'aarch64')
#options=(!verifysource)
url="https://github.com/RoseBlume/Rosary-Bible-App"
#options=(!lto)
license=('GPL-3.0-or-later')
depends=(
  'pacman>6.1'
  'git'
  'qt6-base>=6.4'
  'qt6-declarative>=6.4'
  'qt6-webview'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
source=("Rosary-1.0.0_$CARCH.tar.gz::https://github.com/RoseBlume/Rosary-Bible-App/releases/download/Debianv1.0-1/Rosary-1.0.0_$CARCH.tar.gz")
sha256sums=('4a1f2c2248fe0383624e841560f3b6a989bf1442fbba3ef8606e2003510ec86e')

fdir="$srcdir/Rosary-1.0.0-Linux"


package() {
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -d "$pkgdir/usr/share/metainfo"
  install -m755 "$srcdir/Rosary-1.0.0-Linux/bin/Rosary" "$pkgdir/usr/bin"
  install -m755 "$srcdir/Rosary-1.0.0-Linux/share/applications/Rosary.desktop" "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/Rosary-1.0.0-Linux/share/icons/hicolor/scalable/apps/bible.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/bible.png"
  install -m644 "$srcdir/Rosary-1.0.0-Linux/share/metainfo/Rosary.xml" "$pkgdir/usr/share/metainfo/Rosary.xml"
}
