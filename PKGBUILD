# Maintainer: fila@pruda.com
pkgname=poweradmin
pkgver=2.1.7
pkgrel=1
pkgdesc='web-based DNS administration tool for PowerDNS server'
arch=('any')
url='http://www.poweradmin.org/'
license=('GPL')
depends=('powerdns' 'php')
source=("https://github.com/poweradmin/poweradmin/archive/v$pkgver.tar.gz")
md5sums=('af173ada6f906cfcae17abc13b9d2931')
backup=('etc/webapps/poweradmin/config.inc.php')



package() {
  _destdir=$pkgdir/usr/share/webapps/poweradmin
  _destdir_etc=$pkgdir/etc/webapps/poweradmin

  #source
  install -dm755 $_destdir
  cp -r $srcdir/poweradmin-$pkgver/. $_destdir
  
  cd $_destdir
  mv install x_install
  chmod 700 x_install
  
  
  #config
  install -dm755 $_destdir_etc
  touch $_destdir_etc/config.inc.php
  ln -s /etc/webapps/poweradmin/config.inc.php $_destdir/inc/config.inc.php
  
}