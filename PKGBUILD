# Maintainer: Dominik Wetzel <dimonok@web.de>
pkgname=openclipart-libreoffice
pkgver=0.18
pkgrel=1
pkgdesc="Openclipart Gallary package from Ubuntu for LibreOffice"
arch=('any')
url="https://openclipart.org"
license=('CC0')
depends=('openclipart-png')
source=("http://de.archive.ubuntu.com/ubuntu/pool/universe/o/openclipart/${pkgname}_${pkgver}+dfsg-14_all.deb") 
md5sums=('d29ff698393310caaee600cf5d17f4a1')

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

