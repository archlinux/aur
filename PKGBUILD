# Contributor: kaptoxic

pkgname=cvassistant
pkgver=3.1.0
pkgrel=1
pkgdesc="A tool for creating specialized resumes in a fast and easy"
url='https://sourceforge.net/projects/cvassistant/?source=navbar'
license=('GPL')
arch=('x86_64')
depends=('qt5-base')
#makedepends=('qt5-tools')
source=("http://sourceforge.net/projects/cvassistant/files/${pkgname}-${pkgver}-src.tar.bz2"
       'pro.diff')
md5sums=('1f14e91e090896feca3b037edf973e19'
         '47ecfa602ab70a588fa9c2c10ac5a802')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-src
  patch -p1 -i $srcdir/pro.diff
  
  qmake 
  make 
}

package() {
  cd ${srcdir}${pkgname}-${pkgver}-src

  make INSTALL_ROOT=${pkgdir} install
}
