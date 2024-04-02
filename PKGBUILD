# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Essem <smswessem@gmail.com>

pkgname=szs
pkgver=2.42a
_rev=8989
pkgrel=1
pkgdesc="A set of command line tools to manipulate SZS, U8, BRRES, BREFF, BREFT, BMG, KMP, TEX, TPL, and StaticR.rel files of Mario Kart Wii"
arch=(x86_64)
url="http://szs.wiimm.de/"
license=(GPL)
depends=(libpng)
provides=(szstools wszst wstrt wpatt wmdlt wlect wkmpt wkclt wimgt wctct wbmgt)
conflicts=(szstools)
source=("http://szs.wiimm.de/download/${pkgname}-v${pkgver}-r${_rev}-x86_64.tar.gz")
sha512sums=('a077515b81883b15e5f7ba76e6d4ee5bb42fdd150d0960999c8026896b7df5774b423939bd4d5922168f2700cbde58d397017d650d19b22191fc5a46bae79bf4')

prepare() {
  cd "${pkgname}-v${pkgver}-r${_rev}"-*/
  sed -i "s|^[ \t]*\(BASE_PATH=\).*$|\1${pkgdir}/usr|" install.sh
}

package() {
  cd "${pkgname}-v${pkgver}-r${_rev}"-*/
  ./install.sh --no-sudo
}
