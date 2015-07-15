# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=cambozola
pkgver=0.936
pkgrel=1
pkgdesc="A java servlet for streaming JPEG's from ip Cameras."
url="http://www.charliemouse.com/code/cambozola/"
arch=('any')
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant')
source=("http://www.andywilcock.com/code/cambozola/cambozola-latest.tar.gz")
sha256sums=('4e4e92d95673edd051e6b4d36bed8c5328873f5fc374073760b457d4be33415b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ant
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  cp dist/* ${pkgdir}/usr/share/${pkgname}/
}

# vim:set ts=2 sw=2 et:

