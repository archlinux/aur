# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Essem <smswessem@gmail.com>

pkgname=szs
pkgver=2.33a
_rev=8773
pkgrel=1
pkgdesc="A set of command line tools to manipulate SZS, U8, BRRES, BREFF, BREFT, BMG, KMP, TEX, TPL, and StaticR.rel files of Mario Kart Wii"
arch=(x86_64)
url="http://szs.wiimm.de/"
license=(GPL)
depends=(libpng)
provides=(szstools wszst wstrt wpatt wmdlt wlect wkmpt wkclt wimgt wctct wbmgt)
conflicts=(szstools)
source=("http://szs.wiimm.de/download/${pkgname}-v${pkgver}-r${_rev}-x86_64.tar.gz")
sha512sums=('bc6ef8d7c12d9735656753ee1aeb7a188f68504e735bc434df1d783e2bd729513b439a465133a5a8909eede15bf911c6fef00ebf2add806f3fa7db5aa7e2cf51')

prepare() {
  cd "${pkgname}-v${pkgver}-r${_rev}"-*/
  sed -i "s|^[ \t]*\(BASE_PATH=\).*$|\1${pkgdir}/usr|" install.sh
}

package() {
  cd "${pkgname}-v${pkgver}-r${_rev}"-*/
  ./install.sh --no-sudo
}
