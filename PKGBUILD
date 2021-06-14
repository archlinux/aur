# Maintainer: zoe <chp321 at gmail dot com>

pkgname=turtlesport
pkgver=2.1
pkgrel=2
pkgdesc="Java application to communicate with GPS devices for fitness (Garmin, Suunto...)."
# https is not available :
url="http://turtlesport.sourceforge.net/EN/home.html"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('java-runtime>=7')
optdepends=('gpsd: for data downloads directly from your device')
#makedepends=('tar')
#makedepends=('rpmextract')
#source=("http://netix.dl.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}_${pkgver}-1_all.deb")
#source=("https://phoenixnap.dl.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}-1.all.rpm")
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}-1.all.rpm")         
md5sums=('aa3e7cd25ec82d2b8495947ac158e74b')

package() {
  cd $srcdir
  #ar x "${pkgname}_${pkgver}-1_all.deb"
  #tar xvf data.tar.gz
  #rpmextract.sh ${pkgname}-${pkgver}-1.all.rpm
  cp -rp usr $pkgdir
  mkdir -p $pkgdir/usr/share/java/${pkgname}/
  cd $pkgdir
  mv usr/share/${pkgname}/* usr/share/java/${pkgname}/
  sed -i 's/usr\/share/usr\/share\/java/' usr/bin/${pkgname}
  sed -i 's/usr\/share/usr\/share\/java/' usr/share/applications/${pkgname}.desktop
  rmdir usr/share/${pkgname}/
}
