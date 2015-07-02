# Maintainer: Aurelijus Bruzas <aurelijus.b@gmail.com>
pkgname=vimpal-qt4
pkgsrcname=vimpal
pkgver=1.6.0
pkgrel=1
pkgdesc="A file browser for VIM (Qt4)"
arch=(i686 x86_64)
url="http://vimpal.sourceforge.net/"
license=('GPL')
depends=('qt4')
conflicts=('vimpal')
source=("http://sourceforge.net/projects/${pkgsrcname}/files/${pkgsrcname}_${pkgver}.tar.gz")
md5sums=('f8e24e7e302beb9395c46f052fd5bbfc')

build() {
  cd ${srcdir}/${pkgsrcname}_${pkgver}

  qmake-qt4
  make
}

package() {
  cd ${srcdir}

  install -Dm755 "${pkgsrcname}_${pkgver}/$pkgsrcname" "$pkgdir/usr/bin/$pkgsrcname"
  install -Dm644 "${pkgsrcname}_${pkgver}/$pkgsrcname.desktop" "$pkgdir/usr/share/applications/$pkgsrcname.desktop"
  install -Dm644 "${pkgsrcname}_${pkgver}/$pkgsrcname.appdata.xml" "$pkgdir/usr/share/appdata/$pkgsrcname.appdata.xml"
  install -Dm644 "${pkgsrcname}_${pkgver}/img/icon.png" "$pkgdir/usr/share/pixmaps/$pkgsrcname.png"
}
