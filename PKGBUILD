# Maintainer: Arne Hoch <arne@derhoch.de>

pkgname=dbeaver
pkgver=3.8.2
pkgrel=1
pkgdesc="A free universal database tool for developers and database administrators"
arch=('i686' 'x86_64')
url="http://dbeaver.jkiss.org/"
license=("GPL2")
depends=('java-runtime>=1.7' 'gtk2' 'gtk-update-icon-cache')

source=(dbeaver.desktop)
source_i686=("http://dbeaver.jkiss.org/files/$pkgver/dbeaver-ce-$pkgver-linux.gtk.x86.tar.gz")
source_x86_64=("http://dbeaver.jkiss.org/files/$pkgver/dbeaver-ce-$pkgver-linux.gtk.x86_64.tar.gz")

sha256sums=('d6890b86f1ece47d2bc6f039f89a90eba985376ccb117d832fcddd9a103f6689')
sha256sums_i686=('a0e7e0cf1042914cfae8b7b588295e1ccd46cf435e30d6ef9a7b49009a3c2508')
sha256sums_x86_64=('e9d107063c8441f8acc5b87fef7cf51b3fd6d0703e4f3a82b094f03c08a93919')

package() {
  cd $pkgdir
  mkdir -p opt/
  mkdir -p usr/bin
  mkdir -p usr/share/applications
  mkdir -p usr/share/icons/hicolor/48x48/apps

  cp -r $srcdir/$pkgname opt/
  cp opt/dbeaver/icon.xpm usr/share/icons/hicolor/48x48/apps/dbeaver.xpm
  ln -s /opt/dbeaver/dbeaver usr/bin/dbeaver
  install -m 644 $srcdir/dbeaver.desktop $pkgdir/usr/share/applications/
}
