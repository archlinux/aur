# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=szs
pkgver=1.36b

_svnrev=5690

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
sha512sums_i686=('8a83d04e757164f63345dddeeed33ca01b7cbcb49e1a215bad703d59fae60212ff0201892492721938dbbb687b729dad94eeecdc74641a3c970937305f2003f6')
sha512sums_x86_64=('1f8c4cd922f78373835cc9ee44103c7a67b630c0a1ef75f35dbced5157bbb10240939f4990cce73f9c7a6a1e94af8f88b2d8eba786418ee05d6f2ee2dfea5f71')

prepare() {
  cd "${pkgname}-v${pkgver}-r${_svnrev}"-*/
  sed -i "s|^[ \t]*\(BASE_PATH=\).*$|\1${pkgdir}/usr|" install.sh
}

package() {
  cd "${pkgname}-v${pkgver}-r${_svnrev}"-*/
  ./install.sh
}
