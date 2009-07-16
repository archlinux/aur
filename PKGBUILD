# $Id: PKGBUILD,v 1.2 2009/04/09 09:51:55 sergej Exp $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=flyspray
pkgver=0.9.9.5.1
pkgrel=1
pkgdesc="A PHP web-based bug tracker"
arch=('i686' 'x86_64')
url="http://www.flyspray.org/"
license=('GPL')
depends=('php')
makedepends=(unzip)
backup=(srv/http/flyspray/.htaccess)
source=(http://flyspray.org/flyspray-$pkgver.zip)
noextract=(flyspray-$pkgver.zip)
md5sums=('d2844e01d90bffeaba4645ba10db9510')

build() {
  mkdir $srcdir/flyspray-${pkgver}
  (cd $srcdir/flyspray-${pkgver} && unzip ../flyspray-$pkgver.zip)

  _instdir=${startdir}/pkg/srv/http/flyspray
  mkdir -p ${_instdir}
  cd ${_instdir}
  cp -ra ${startdir}/src/flyspray-${pkgver}/* .
  echo "deny from all" > .htaccess
}
