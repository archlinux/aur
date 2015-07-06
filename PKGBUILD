# Maintainer: realitygaps <realitygaps AT yahoo DOT com>

pkgname=openatrium
pkgver=2.12
pkgrel=1
pkgdesc="Open Atrium is an intranet and project management system based on drupal"
arch=('i686' 'x86_64')
url="http://www.openatrium.com/"
license=('GPL')
depends=('php')
install=${pkgname}.install
backup=(srv/http/atrium/.htaccess)
source=(http://ftp.drupal.org/files/projects/${pkgname}-7.x-${pkgver}-core.tar.gz)
md5sums=('11018e58a824b6531b49cb096e5c5f87')

build() {
  mkdir -p $startdir/pkg/${pkgname}/srv/http/atrium
  cp -r $startdir/src/$pkgname-7.x-$pkgver/{*,.htaccess} $startdir/pkg/${pkgname}/srv/http/atrium
  echo "deny from all" > $startdir/pkg/${pkgname}/srv/http/atrium/.htaccess
}
