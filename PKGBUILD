# Maintainer: Aurelijus Bruzas <aurelijus.b@gmail.com>
pkgname=vimpal
pkgver=1.6.0
pkgrel=1
pkgdesc="A file browser for VIM"
arch=(i686 x86_64)
url="http://vimpal.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'qt5-tools')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}_${pkgver}.tar.gz")
md5sums=('f8e24e7e302beb9395c46f052fd5bbfc')

build() {
  cd ${srcdir}/${pkgname}_${pkgver}

  qmake-qt5
  make
}

package() {
  cd ${srcdir}

  install -Dm755 "${pkgname}_${pkgver}/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "${pkgname}_${pkgver}/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${pkgname}_${pkgver}/$pkgname.appdata.xml" "$pkgdir/usr/share/appdata/$pkgname.appdata.xml"
  install -Dm644 "${pkgname}_${pkgver}/img/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
