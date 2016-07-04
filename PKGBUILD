# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=pcf-unifont
pkgver=9.0.01
pkgrel=1
pkgdesc="Bitmap version of the GNU Unifont"
arch=('any')
license=('GPL')
url="http://unifoundry.com/unifont.html"
source=(http://unifoundry.com/pub/unifont-${pkgver}/font-builds/unifont-${pkgver}.pcf.gz
"$pkgname.install")
md5sums=('b0e8404bcaa0f658dc83492e23838004'
         'b66d07781191b1266dd775722be14cff')
install="$pkgname.install"
noextract=(unifont-${pkgver}.pcf.gz)

_pcf_gz=unifont-$pkgver.pcf.gz

package() {
  cd "$srcdir"
  install --mode=644 -D --no-target-dir "$_pcf_gz" "$pkgdir/usr/share/fonts/misc/$_pcf_gz"
  cd $pkgdir/usr/share/fonts/misc/ && ln --symbolic --force "$_pcf_gz" unifont.pcf.gz
}
