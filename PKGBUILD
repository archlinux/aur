# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=touchegg
pkgver=1.1.1
pkgrel=3
pkgdesc="Multitouch gesture recognizer"
arch=(i686 x86_64)
url="https://code.google.com/p/touchegg/"
license=(GPL)
depends=(qt4 geis)
source=("https://github.com/JoseExposito/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('99d934b1c5e161a19499ecce54ac3efd92b739937ff0844d68d0af73a4fcd4b6b2ab39e7e3780f6372486d6dd3433aec3e8e011e240df87ff42e912a4d50222f')

build() {
  cd "$srcdir/${pkgname}-${pkgver}/touchegg"
  qmake-qt4 
  make 
  
  cd "$srcdir/${pkgname}-${pkgver}/touchegg-gui"
  qmake-qt4
  make 
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/touchegg"
  make INSTALL_ROOT="${pkgdir}" install
  cd "$srcdir/${pkgname}-${pkgver}/touchegg-gui"
  make INSTALL_ROOT="${pkgdir}" install
}
