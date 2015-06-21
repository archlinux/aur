# Contributor: Médéric Boquien <mboquien@free.fr>
pkgname=sofa
pkgver=20150209
pkgrel=1
pkgdesc="Set of algorithms and procedures used in fundamental astronomy"
url="http://www.iausofa.org"
arch=('x86_64' 'i686')
license=('custom')
source=("http://www.iausofa.org/2015_0209_C/sofa_c-${pkgver}_a.tar.gz")
md5sums=('ef408af60c8ca022ca7e0215c6933f0f')

build() {
  cd "${srcdir}/${pkgname}/${pkgver}_a/c/src"
  make CFLAGF="-c -O -fPIC"
}

package() {
  cd "${srcdir}/${pkgname}/${pkgver}_a/c/src"
  make INSTALL_DIR="${pkgdir}/usr" install

  cd "${srcdir}/${pkgname}/${pkgver}_a/c/"
  install -Dm644 00READ.ME "$pkgdir/usr/share/doc/$pkgname/00READ.ME"
  install -m644 doc/*.lis "$pkgdir/usr/share/doc/$pkgname/"
}
