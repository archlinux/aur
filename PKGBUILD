# Maintainer: Arne Hoch <arne@derhoch.de>

pkgname=dbeaver
pkgver=3.7.5
pkgrel=1
pkgdesc="A free universal database tool for developers and database administrators"
arch=('i686' 'x86_64')
url="http://dbeaver.jkiss.org/"
license=("GPL2")
depends=('java-runtime>=1.7' 'gtk2' 'gtk-update-icon-cache')
#makedepends=('unzip')
install=dbeaver.install

source=(dbeaver.desktop dbeaver.install)
source_i686=("http://dbeaver.jkiss.org/files/$pkgver/dbeaver-ce-$pkgver-linux.gtk.x86.tar.gz")
source_x86_64=("http://dbeaver.jkiss.org/files/$pkgver/dbeaver-ce-$pkgver-linux.gtk.x86_64.tar.gz")

sha256sums=('cf1e850dcb3544507eeb59b8d2e84b67cd25b546e3eaf03a0ab27ca841361478'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_i686=('159ec60b3f76b55a61adc3c7928f20a990cabe6cd2e4673edbcd56f05d0a439f')
sha256sums_x86_64=('3e6450b1cb2dba79df32f30385362b80e891028dc03202f3de5b665c0321eef1')

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
