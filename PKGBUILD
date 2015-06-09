# Maintainer: John Lane <archlinux at jelmail dot com>
pkgname=clamassassin
pkgver=1.2.4
pkgrel=5
pkgdesc="A simple virus filter wrapper for ClamAV."
url="http://jameslick.com/clamassassin/"
arch=('any')
license=('BSD')
depends=('procmail' 'clamav' 'sh')
source=(http://jameslick.com/clamassassin/clamassassin-${pkgver}.tar.gz)
md5sums=('ce063e807ae29ab6666db9e01d01cc4c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-clamdscan  
  make
  }
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d ${pkgdir}/usr/bin
  make bindir=${pkgdir}/usr/bin install 
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
}
