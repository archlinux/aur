# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Essem <smswessem@gmail.com>

pkgname=szs
pkgver=2.39a
_rev=8904
pkgrel=1
pkgdesc="A set of command line tools to manipulate SZS, U8, BRRES, BREFF, BREFT, BMG, KMP, TEX, TPL, and StaticR.rel files of Mario Kart Wii"
arch=(x86_64)
url="http://szs.wiimm.de/"
license=(GPL)
depends=(libpng)
provides=(szstools wszst wstrt wpatt wmdlt wlect wkmpt wkclt wimgt wctct wbmgt)
conflicts=(szstools)
source=("http://szs.wiimm.de/download/${pkgname}-v${pkgver}-r${_rev}-x86_64.tar.gz")
sha512sums=('ca9c256d5837b9a0afbea00a31c329e40fe1c9a0012ec40f2e7fef5ce5978a489d70c458a864c663da8bfc91d93910739f09d9cb6f0b5cfc024acf2d2270ba81')

prepare() {
  cd "${pkgname}-v${pkgver}-r${_rev}"-*/
  sed -i "s|^[ \t]*\(BASE_PATH=\).*$|\1${pkgdir}/usr|" install.sh
}

package() {
  cd "${pkgname}-v${pkgver}-r${_rev}"-*/
  ./install.sh --no-sudo
}
