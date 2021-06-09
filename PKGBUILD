# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=szs
pkgver=2.26a
_svnrev=8462
pkgrel=1
pkgdesc="A set of command line tools to manipulate SZS, U8, BRRES, BREFF, BREFT, BMG, KMP, TEX, TPL, and StaticR.rel files of Mario Kart Wii"
arch=(i686 x86_64)
url="http://szs.wiimm.de/"
license=(GPL)
depends=(libpng)
provides=(szstools)
conflicts=(szstools)
source_i686=("http://szs.wiimm.de/download/${pkgname}-v${pkgver}-r${_svnrev}-i386.tar.gz")
source_x86_64=("http://szs.wiimm.de/download/${pkgname}-v${pkgver}-r${_svnrev}-x86_64.tar.gz")
sha512sums_i686=('414a5f3b0ced47d44795b57728b9bd19cb08d64bdadb4c63f14458a3cfc0adc88d2a38706df0ad54f88286aea527559157e2bcf20822a32798aa62c8286f51eb')
sha512sums_x86_64=('0dcd9eb5fc149ea5754fe5855c20fc3f326c6a16e8935c88ac395d5d1280489a90d86d988c349a964867c1b7842b09d70f304b60159825d3a512661cfa7aec49')

prepare() {
  cd "${pkgname}-v${pkgver}-r${_svnrev}"-*/
  sed -i "s|^[ \t]*\(BASE_PATH=\).*$|\1${pkgdir}/usr|" install.sh
}

package() {
  cd "${pkgname}-v${pkgver}-r${_svnrev}"-*/
  ./install.sh
}
