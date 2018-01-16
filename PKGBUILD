# Maintainer: Dominik Wetzel <dimonok@web.de>
pkgname=openclipart2-libreoffice
pkgver=2.0
pkgrel=1
pkgdesc="Openclipart 2.0 Gallary package from Ubuntu for LibreOffice"
arch=('any')
url="https://openclipart.org"
license=('CC0')
depends=('openclipart2-png')
source=("http://de.archive.ubuntu.com/ubuntu/pool/universe/o/openclipart2/${pkgname}_${pkgver}+dfsg-1ubuntu1_all.deb") 
md5sums=('eeef9113e2445e177bf86a695496dd7a')

prepare() {
  cd $srcdir
  tar xzf data.tar.gz -C .
}

package() {
  cd $srcdir
  install -D -m644 "usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  rm -r ${srcdir}/usr/share/doc
  cd $pkgdir
  cp -r $srcdir/usr .  
}

