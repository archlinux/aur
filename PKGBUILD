# Maintainer: Arne Hoch <arne@derhoch.de>

pkgname=dbeaver
pkgver=3.7.6
pkgrel=3
pkgdesc="A free universal database tool for developers and database administrators"
arch=('i686' 'x86_64')
url="http://dbeaver.jkiss.org/"
license=("GPL2")
depends=('java-runtime>=1.7' 'gtk2' 'gtk-update-icon-cache')

source=(dbeaver.desktop)
source_i686=("http://dbeaver.jkiss.org/files/$pkgver/dbeaver-ce-$pkgver-linux.gtk.x86.tar.gz")
source_x86_64=("http://dbeaver.jkiss.org/files/$pkgver/dbeaver-ce-$pkgver-linux.gtk.x86_64.tar.gz")

sha256sums=('d6890b86f1ece47d2bc6f039f89a90eba985376ccb117d832fcddd9a103f6689')
sha256sums_i686=('b3d12f58ca20c1ee9af1f7f3086bd317e7fffcb13ebd74cd3fe0bbc82d56f9bb')
sha256sums_x86_64=('b6b8b1d2673eb4608844eaa1abc02fb15f99d2b129e55fbe831e60cc45f374f9')

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
