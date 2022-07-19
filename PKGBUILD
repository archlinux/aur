# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Essem <smswessem@gmail.com>

pkgname=szs
pkgver=2.27b
_rev=8534
pkgrel=1
pkgdesc="A set of command line tools to manipulate SZS, U8, BRRES, BREFF, BREFT, BMG, KMP, TEX, TPL, and StaticR.rel files of Mario Kart Wii"
arch=(x86_64)
url="http://szs.wiimm.de/"
license=(GPL)
depends=(libpng)
provides=(szstools wszst wstrt wpatt wmdlt wlect wkmpt wkclt wimgt wctct wbmgt)
conflicts=(szstools)
source_i686=("http://szs.wiimm.de/download/${pkgname}-v${pkgver}-r${_rev}-i386.tar.gz")
source_x86_64=("http://szs.wiimm.de/download/${pkgname}-v${pkgver}-r${_rev}-x86_64.tar.gz")
sha512sums_i686=('1112326f0493b225aeb4189f25bfcc10b94da298c8abcd2d8cd91b24e4ce010a1e04565be4973a8be169b56a1484c4b05b91cc2ff93cb0edce5a326286cff38d')
sha512sums_x86_64=('01d1f957a8dda24855e71cbd1554d1accbd08d8482d83fb8571768d17f0aed6a30ccbd08f672be0ca7cff40c49cda0811d96d55545211bdacec241f25d76348d')

prepare() {
  cd "${pkgname}-v${pkgver}-r${_rev}"-*/
  sed -i "s|^[ \t]*\(BASE_PATH=\).*$|\1${pkgdir}/usr|" install.sh
}

package() {
  cd "${pkgname}-v${pkgver}-r${_rev}"-*/
  ./install.sh --no-sudo
}
