# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=pcf-unifont
pkgver=7.0.06
pkgrel=1
pkgdesc="Bitmap version of the GNU Unifont"
arch=('any')
license=('GPL')
url="http://unifoundry.com/unifont.html"
source=(http://unifoundry.com/pub/unifont-${pkgver}/font-builds/unifont-${pkgver}.pcf.gz)
md5sums=('d7d0c102abff5174d217c2d5976e13b7')
noextract=(unifont-${pkgver}.pcf.gz)

_pcf_gz=unifont-$pkgver.pcf.gz

package() {
  cd "$srcdir"
  install --mode=644 -D --no-target-dir "$_pcf_gz" "$pkgdir/usr/share/fonts/misc/$_pcf_gz"
  cd $pkgdir/usr/share/fonts/misc/ && ln --symbolic --force "$_pcf_gz" unifont.pcf.gz
}
