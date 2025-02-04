# Maintainer: robertfoster

pkgname=authpuppy
pkgver=1.0.0
pkgrel=1
pkgdesc="A new implementation  of the authentication server for Wifidog networks."
arch=('any')
url="http://www.authpuppy.org/"
license=('GPL')
source=("http://launchpadlibrarian.net/78643482/$pkgname-$pkgver-stable.tgz"
  httpd-authpuppy.conf)
depends=('apache' 'php' 'mysql')
install='authpuppy.install'
options=(!strip)

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/srv/http/
  cp -r authpuppy $pkgdir/srv/http/
  chmod 777 -R $pkgdir/srv/http/authpuppy/*
  mkdir -p $pkgdir/etc/httpd/conf/extra
  cp httpd-authpuppy.conf $pkgdir/etc/httpd/conf/extra
  mkdir -p $pkgdir/var/log/httpd/authpuppy/
}

sha256sums=('fd11108ee443cc63f2f321ebcebeabb2c8719fa6ade07fa36501ee1719a3a3d0'
            'a730d59cf02756b687c97134f1b9dcb2a5b9929ab5232a9941b593974591a254')
