# Contributor: Médéric Boquien <mboquien@free.fr>
pkgname=sofa
pkgver=20160503_a
pkgrel=1
pkgdesc="Set of algorithms and procedures used in fundamental astronomy"
url="http://www.iausofa.org"
arch=('x86_64' 'i686')
license=('custom')
source=("http://www.iausofa.org/2016_0503_C/sofa_c-${pkgver}.tar.gz")
md5sums=('8f95a114b9386d1bf8cb05b4c81875b0')

build() {
  cd "${srcdir}/${pkgname}/${pkgver}/c/src"
  make CFLAGF="-c -O -fPIC"
}

package() {
  cd "${srcdir}/${pkgname}/${pkgver}/c/src"
  make INSTALL_DIR="${pkgdir}/usr" install

  cd "${srcdir}/${pkgname}/${pkgver}/c/"
  install -Dm644 00READ.ME "$pkgdir/usr/share/doc/$pkgname/00READ.ME"
  install -m644 doc/*.lis "$pkgdir/usr/share/doc/$pkgname/"
}
