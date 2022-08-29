# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Essem <smswessem@gmail.com>

pkgname=szs
pkgver=2.28a
_rev=8636
pkgrel=1
pkgdesc="A set of command line tools to manipulate SZS, U8, BRRES, BREFF, BREFT, BMG, KMP, TEX, TPL, and StaticR.rel files of Mario Kart Wii"
arch=(x86_64)
url="http://szs.wiimm.de/"
license=(GPL)
depends=(libpng)
provides=(szstools wszst wstrt wpatt wmdlt wlect wkmpt wkclt wimgt wctct wbmgt)
conflicts=(szstools)
source=("http://szs.wiimm.de/download/${pkgname}-v${pkgver}-r${_rev}-x86_64.tar.gz")
sha512sums=('e5d29dc353607369b0abe6649c2dc98713f47a2d47c9e2f15f79e5026027438b6ee833374dc74e19e8dd0cac56d32be63040c67f39f8941050a401024eb49b0c')

prepare() {
  cd "${pkgname}-v${pkgver}-r${_rev}"-*/
  sed -i "s|^[ \t]*\(BASE_PATH=\).*$|\1${pkgdir}/usr|" install.sh
}

package() {
  cd "${pkgname}-v${pkgver}-r${_rev}"-*/
  ./install.sh --no-sudo
}
