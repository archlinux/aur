# Maintainer: M0Rf30 <morf3089@gmail.com>
# Contributors : hoban
# Contributors : Nrm

pkgname=subsonic-beta
pkgver=5.0.beta1
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('i686' 'x86_64')
url="http://subsonic.org/"
license=('GPL')
depends=('jre7-openjdk-headless' 'libcups')
conflicts=('subsonic')
source=(http://prdownloads.sourceforge.net/subsonic/subsonic-${pkgver}-standalone.tar.gz      
	'subsonic.service')
backup=('var/subsonic/db')
install=$pkgname.install
 
package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/subsonic
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp  * $pkgdir/var/subsonic
  rm $pkgdir/var/subsonic/{subsonic.bat,subsonic-${pkgver}-standalone.tar.gz}
  cp $srcdir/subsonic.service $pkgdir/usr/lib/systemd/system
  chmod +x $pkgdir/var/subsonic/subsonic.sh
}

md5sums=('04addd4f090b75d09e3831e77982be2e'
         '0d321009898118fa9390631fd21c5e63')
