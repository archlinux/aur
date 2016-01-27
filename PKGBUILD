# Maintainer: zoe <chp321 at gmail dot com>

pkgname=turtlesport
pkgver=1.7
pkgrel=1
pkgdesc="Java application to communicate with GPS devices for fitness (Garmin, Suunto...)."
url="http://turtlesport.sourceforge.net/EN/home.html"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('java-runtime>=7')
makedepends=('tar')
source=("http://netix.dl.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}_${pkgver}-1_all.deb")
md5sums=('50e41f2c4d7c4c9813b45a3c653dd2bc')

package() {
  cd $srcdir
  ar x "${pkgname}_${pkgver}-1_all.deb"
  tar xvf data.tar.gz
  cp -rp usr $pkgdir
  mkdir -p $pkgdir/usr/share/java/${pkgname}/
  cd $pkgdir
  mv usr/share/${pkgname}/* usr/share/java/${pkgname}/
  sed -i 's/usr\/share/usr\/share\/java/' usr/bin/${pkgname}
  rmdir usr/share/${pkgname}/
}