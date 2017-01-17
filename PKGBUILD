# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=pcf-unifont
pkgver=9.0.06
pkgrel=1
pkgdesc="Bitmap version of the GNU Unifont"
arch=('any')
license=('GPL')
url="http://unifoundry.com/unifont.html"
source=(http://unifoundry.com/pub/unifont-${pkgver}/font-builds/unifont-${pkgver}.pcf.gz
"$pkgname.install")
md5sums=('fc1de0fd5ce0f235906da98aefbd9517'
         'b66d07781191b1266dd775722be14cff')
install="$pkgname.install"
noextract=(unifont-${pkgver}.pcf.gz)

_pcf_gz=unifont-$pkgver.pcf.gz

package() {
  cd "$srcdir"
  install --mode=644 -D --no-target-dir "$_pcf_gz" "$pkgdir/usr/share/fonts/misc/$_pcf_gz"
  cd $pkgdir/usr/share/fonts/misc/ && ln --symbolic --force "$_pcf_gz" unifont.pcf.gz
}
