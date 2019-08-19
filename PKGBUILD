pkgname=goglus-cursor-theme
pkgver=1.0
pkgrel=4
pkgdesc="X11 Mouse Theme"
arch=('any')
url="https://www.opendesktop.org/p/999675/"
license=('GPL')
depends=('xorg-xcursorgen')

source=("https://github.com/arkhan/goglus_cursor/archive/v${pkgver}.tar.gz")
md5sums=('e727cc3e3fba1f4b849b5af9e97175a6')

package() {
  cd $srcdir/goglus_cursor-$pkgver/source
  mkdir -p cursors
  sh make.sh
  install -d $pkgdir/usr/share/icons/Goglus
  cp -rf $srcdir/goglus_cursor-$pkgver/source/cursors $pkgdir/usr/share/icons/Goglus/cursors
  cp -rf $srcdir/goglus_cursor-$pkgver/index.theme $pkgdir/usr/share/icons/Goglus/index.theme
}
