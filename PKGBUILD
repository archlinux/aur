# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=flyspray
pkgver=0.9.9.6
pkgrel=3
pkgdesc="A PHP web-based bug tracker"
arch=('any')
url="http://www.flyspray.org/"
license=('GPL')
depends=('php')
makedepends=('unzip')
backup=('etc/webapps/flyspray/.htaccess')
options=('!strip')
noextract=(flyspray-$pkgver.zip)
source=(http://flyspray.org/flyspray-$pkgver.zip)
md5sums=('095b46b08881554790830edab51970ed')

build() {
  mkdir $srcdir/flyspray-${pkgver}
  (cd $srcdir/flyspray-${pkgver} && unzip ../flyspray-$pkgver.zip)

  _instdir=$pkgdir/usr/share/webapps/flyspray
  mkdir -p ${_instdir} $pkgdir/etc/webapps/flyspray
  cd ${_instdir}
  cp -ra $srcdir/flyspray-${pkgver}/* .
  echo "deny from all" > $pkgdir/etc/webapps/flyspray/.htaccess
  ln -s /etc/webapps/flyspray/.htaccess .htaccess
}
