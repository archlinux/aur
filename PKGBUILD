# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=pcf-unifont
pkgver=10.0.01
pkgrel=1
pkgdesc="Bitmap version of the GNU Unifont"
arch=('any')
license=('GPL')
url="http://unifoundry.com/unifont.html"
source=(http://unifoundry.com/pub/unifont-${pkgver}/font-builds/unifont-${pkgver}.pcf.gz
"$pkgname.install")
sha256sums=('e644cd7ef7ee01d1f7247d49559435bc59e7f5f7e0886d3109d04e0250c9146a'
            '4722b8c18c60ef36a1702b0dbbfbd723384b4cb04d30bdc324013a2a524936e3')
install="$pkgname.install"
noextract=(unifont-${pkgver}.pcf.gz)

_pcf_gz=unifont-$pkgver.pcf.gz

package() {
  cd "$srcdir"
  install --mode=644 -D --no-target-dir "$_pcf_gz" "$pkgdir/usr/share/fonts/misc/$_pcf_gz"
  cd $pkgdir/usr/share/fonts/misc/ && ln --symbolic --force "$_pcf_gz" unifont.pcf.gz
}
