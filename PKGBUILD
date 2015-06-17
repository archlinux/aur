# Mantainer: M0Rf30

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

md5sums=('a168ba71cd0e4347ab0983daf6d8e150'
         '1b008fb4616c661a22fcb5584fce8846')
