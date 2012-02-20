# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=flyspray
pkgver=0.9.9.6
pkgrel=2
pkgdesc="A PHP web-based bug tracker"
arch=('any')
url="http://www.flyspray.org/"
license=('GPL')
depends=('php')
makedepends=(unzip)
backup=(srv/http/flyspray/.htaccess)
source=(http://flyspray.org/flyspray-$pkgver.zip)
noextract=(flyspray-$pkgver.zip)
md5sums=('095b46b08881554790830edab51970ed')

build() {
  mkdir $srcdir/flyspray-${pkgver}
  (cd $srcdir/flyspray-${pkgver} && unzip ../flyspray-$pkgver.zip)

  _instdir=${startdir}/pkg/srv/http/flyspray
  mkdir -p ${_instdir}
  cd ${_instdir}
  cp -ra ${startdir}/src/flyspray-${pkgver}/* .
  echo "deny from all" > .htaccess
}
