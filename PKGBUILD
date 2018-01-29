# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=pcf-unifont
pkgver=10.0.07
pkgrel=1
pkgdesc="Bitmap version of the GNU Unifont"
arch=('any')
license=('GPL')
url="http://unifoundry.com/unifont.html"
source=("http://unifoundry.com/pub/unifont-${pkgver}/font-builds/unifont-${pkgver}.pcf.gz"
        "http://unifoundry.com/pub/unifont-${pkgver}/font-builds/unifont-${pkgver}.pcf.gz.sig")
sha256sums=('d7a745f5ca128cabf515743f9d6355aed066dadf113f4a2aa1dd8ffd6194fa19'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>
noextract=(unifont-${pkgver}.pcf.gz)

_pcf_gz=unifont-$pkgver.pcf.gz

package() {
  cd "$srcdir"
  install --mode=644 -D --no-target-dir "$_pcf_gz" "$pkgdir/usr/share/fonts/misc/$_pcf_gz"
  cd $pkgdir/usr/share/fonts/misc/ && ln --symbolic --force "$_pcf_gz" unifont.pcf.gz
}
