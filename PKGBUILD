pkgname=scangearmp-mx520series-x86_64
pkgver=2.10
pkgrel=1
pkgdesc="Canon Scanner Driver (MX520 Series) x86_64"
url="http://www.canon.at/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mx_series/mx525.aspx"
arch=('x86_64')
license=('custom')
depends=('sane' 'pangox-compat')
conflicts=('scangearmp')
makedepends=('rpmextract')
source=(http://gdlp01.c-wss.com/gds/8/0100005178/01/scangearmp-mx520series-2.10-1-rpm.tar.gz)
md5sums=('fed4acaf4d8c5b6827e2f0087ab62b20')

build() {
  cd "$startdir/src"
  tar -xf $startdir/src/scangearmp-mx520series-$pkgver-$pkgrel-rpm.tar.gz
}

package() {
  cd $pkgdir
  rpmextract.sh $startdir/src/scangearmp-mx520series-$pkgver-$pkgrel-rpm/packages/scangearmp-common-$pkgver-$pkgrel.x86_64.rpm
  rpmextract.sh $startdir/src/scangearmp-mx520series-$pkgver-$pkgrel-rpm/packages/scangearmp-mx520series-$pkgver-$pkgrel.x86_64.rpm
  mkdir -p usr/share/licenses/${pkgname}
  mv usr/lib64 usr/lib
  chmod -R a+rX usr/
}
