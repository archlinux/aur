# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=szs
pkgver=1.40a

_svnrev=6162

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
sha512sums_i686=('4a237ee2539915c4abb075d0725368dbda35ab0e5fd7017b14d7046f50ea8d74e89a8f4a6ed52e49221df2f3a3b653965139b0e485daab3be89ac64e6c61f7fe')
sha512sums_x86_64=('a9df6e188358ba0c186b41aa58edaa6e7489a5412681cc1a6bab4f66f2038efa7a93f354da73a55995ff9c617034fe7dc7511cb13ca17c4e572a9ba7e5565104')

prepare() {
  cd "${pkgname}-v${pkgver}-r${_svnrev}"-*/
  sed -i "s|^[ \t]*\(BASE_PATH=\).*$|\1${pkgdir}/usr|" install.sh
}

package() {
  cd "${pkgname}-v${pkgver}-r${_svnrev}"-*/
  ./install.sh
}
