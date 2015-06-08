# Maintainer: Arne Hoch <arne@derhoch.de>

pkgname=dbeaver
pkgver=3.4.1
pkgrel=1
pkgdesc="A free universal database tool for developers and database administrators"
arch=('i686' 'x86_64')
url="http://dbeaver.jkiss.org/"
license=("GPL2")
depends=('java-runtime>=1.6' 'gtk2' 'gtk-update-icon-cache')
makedepends=('unzip')
install=dbeaver.install

source=(dbeaver.desktop dbeaver.install)
source_i686=(http://dbeaver.jkiss.org/files/dbeaver-$pkgver-linux.gtk.x86.zip)
source_x86_64=(http://dbeaver.jkiss.org/files/dbeaver-$pkgver-linux.gtk.x86_64.zip)

sha256sums=('cf1e850dcb3544507eeb59b8d2e84b67cd25b546e3eaf03a0ab27ca841361478'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_i686=('b4b29b806f9aebc703d27f1e02eb0fada1819e2b3f59cd348b937b45f11c9854')
sha256sums_x86_64=('eb4f9fd65cde495b6cb58e8ed99f6fa024555910c51546c8530a20839f2b6fb6')

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
