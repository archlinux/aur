# Maintainer: Dominik Wetzel <dimonok@web.de>
pkgname=openclipart-png
pkgver=0.18
pkgrel=1
pkgdesc="Openclipart package from Ubuntu (PNG version)"
arch=('any')
url="https://openclipart.org"
license=('CC0')
source=("http://de.archive.ubuntu.com/ubuntu/pool/universe/o/openclipart/${pkgname}_${pkgver}+dfsg-14_all.deb") 
md5sums=('8549b0bb15bbd3d1af0eb9e6137ccb82')

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
