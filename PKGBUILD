# Contributor: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=kaption
pkgver=0.1.1
pkgrel=1
pkgdesc="A KDE utility similar to Jing or Skitch to take an edit desktop snapshots"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Kaption?content=139302"
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=(http://kde-apps.org/CONTENT/content-files/139302-${pkgname}-${pkgver}.tar.bz2)
license=('GPL')
md5sums=('f2a9427161319bae7cb793c1c50e41bc')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  cmake CMakeLists.txt -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
