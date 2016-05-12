# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=cambozola
pkgver=0.936
pkgrel=2
pkgdesc="A java servlet for streaming JPEG's from ip Cameras."
url="http://www.charliemouse.com/code/cambozola/"
arch=('any')
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant')
source=("http://www.andywilcock.com/code/cambozola/cambozola-latest.tar.gz")
sha256sums=('a987a49becd8742a671d36ba0e028c7fdfdd6ef65e8d90d18521e545be810e5a')

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

