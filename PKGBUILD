# Maintainer: Joseph Post <joe@jcpst.com>
# Previous Maintainer: Stephan Wienczny <stephan@wienczny.de>

pkgname=dbeaver-ee
pkgver=3.5.1
pkgrel=1
pkgdesc="A free universal database tool for developers and database administrators. Enterprise Edition includes NoSQL database support"
arch=('i686' 'x86_64')
url="http://dbeaver.jkiss.org/"
license=("GPL")
depends=('java-runtime>=1.7' 'gtk2' 'gtk-update-icon-cache')
install=dbeaver-ee.install

source=(dbeaver-ee.desktop dbeaver-ee.install)
source_i686=(http://dbeaver.jkiss.org/files/${pkgver}/dbeaver-ee-${pkgver}-linux.gtk.x86.tar.gz)
source_x86_64=(http://dbeaver.jkiss.org/files/${pkgver}/dbeaver-ee-${pkgver}-linux.gtk.x86_64.tar.gz)
sha256sums=('453912912ae8377b16ef74a3e7d93ea588792ee8f7054a573e9fe9b93cd9265f'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_i686=('37f714b12671c1bd93f6bf7891421d8e08eb6872783135670720b132a1e39acf')
sha256sums_x86_64=('97649720704ccdb4ad5183ab4897945bf07028ff8f5f951456afda04cf567074')

package() {
  cd $pkgdir
  mkdir -p opt/
  mkdir -p usr/bin
  mkdir -p usr/share/applications
  mkdir -p usr/share/icons/hicolor/48x48/apps
  
  cp -r $srcdir/dbeaver opt/dbeaver-ee
  cp opt/dbeaver-ee/icon.xpm usr/share/icons/hicolor/48x48/apps/dbeaver-ee.xpm
  ln -s /opt/dbeaver-ee/dbeaver usr/bin/dbeaver-ee
  install -m 644 $srcdir/dbeaver-ee.desktop $pkgdir/usr/share/applications/
}

