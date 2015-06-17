# Maintainer: M0Rf30
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=kcm_webcam
pkgver=0.2.2.1
pkgrel=2
url="http://kde-apps.org/content/show.php/KCM+webcam+support+?content=119405"
pkgdesc="A modified version of Password & User Account section"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('kdelibs' 'opencv')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/119405-kcm.tar.gz")

build(){	
  cd ${srcdir}/kcm
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package(){
  cd ${srcdir}/kcm
  make DESTDIR="${pkgdir}" install
}
md5sums=('9c00bbdd5a9857c1d98cc2b29bccd6c6')
