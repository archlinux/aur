# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=szs
pkgver=2.23a

_svnrev=8357

pkgrel=1
pkgdesc="A set of command line tools to manipulate SZS, U8, BRRES, BREFF, BREFT, BMG, KMP, TEX, TPL, and StaticR.rel files of Mario Kart Wii"
arch=(i686 x86_64)
url="http://szs.wiimm.de/"
license=(GPL)
depends=(libpng)
makedepends=(subversion)
provides=(szstools)
conflicts=(szstools)
source_i686=("http://szs.wiimm.de/download/${pkgname}-v${pkgver}-r${_svnrev}-i386.tar.gz")
source_x86_64=("http://szs.wiimm.de/download/${pkgname}-v${pkgver}-r${_svnrev}-x86_64.tar.gz")
sha512sums_i686=('4538a390cbcbb3061f93471161a765751e4eab8cb63b447b710fa54e02dbdf60c760764159de49355c3d6cd2c0dd004be708a816b10131ced1b9913e0394277f')
sha512sums_x86_64=('314c490f9f7889d37229cdd98b8cd12ae9ee691c99e0c4fb81de098e6c2a0a24bc0ad8b6573c94be5a296a45a691254d0950199b6e5f487aed50e12b1b8c8686')

prepare() {
  cd "${pkgname}-v${pkgver}-r${_svnrev}"-*/
  sed -i "s|^[ \t]*\(BASE_PATH=\).*$|\1${pkgdir}/usr|" install.sh
}

package() {
  cd "${pkgname}-v${pkgver}-r${_svnrev}"-*/
  ./install.sh
}
