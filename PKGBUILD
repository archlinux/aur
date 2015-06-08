# Contributor: Mladen Pejakovic <pejakm@gmail.com>
# Maintainer: André Fettouhi <a.fettouhi@gmail.com>

pkgname=kcm-qt-graphicssystem
pkgver=1.3
pkgdesc="This KCM allows you to easily configure the standard Qt graphics system."
pkgrel=2
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php?content=129817"
license=(GPL)
makedepends=('cmake' 'automoc4')
depends=('kdelibs')
options=()
source=(http://kde-apps.org/CONTENT/content-files/129817-${pkgname}-${pkgver}.tar.xz)
md5sums=('5271aec766a9fdb3102c3710cd09347f')

build(){	
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_PROBER=ON \
    -DCMAKE_BUILD_TYPE=Release
  make || return 1
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}    
  make DESTDIR="${pkgdir}" install || return 1
}