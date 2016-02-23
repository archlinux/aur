pkgname=cvassistant
_pkgname=CVAssistant
pkgver=2.0.0
pkgrel=1
pkgdesc="CV Assistant helps you create specialized resumes in Word .docx format fast and easy."
url='https://sourceforge.net/projects/cvassistant/?source=navbar'
license=('GPL')
arch=('x86_64')
depends=('qt5-base')
#makedepends=('qt5-tools')
source=("http://sourceforge.net/projects/cvassistant/files/${pkgname}_${pkgver}.tar.bz2"
       'pro.diff')
md5sums=('7f8aa019ef2cacb327b18f97a1e1f7d8'
         '47ecfa602ab70a588fa9c2c10ac5a802')

build() {
  cd ${srcdir}/${_pkgname}
  patch -p1 -i $srcdir/pro.diff
  
  /usr/lib/qt5/bin/qmake 
  make 
}

package() {
  cd ${srcdir}/${_pkgname}

  make INSTALL_ROOT=${pkgdir} install
}