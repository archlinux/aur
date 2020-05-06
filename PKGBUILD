# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=werckmeister-bin
pkgver=0.1.53
pkgrel=1
pkgdesc="An open source Sheet Music MIDI Compiler"
arch=('x86_64')
url="http://werckme.github.io"
license=('GPL-3.0')
provides=('werckmeister')
depends=('lua')
options=('!strip')
source=("${pkgname}-${pkgver}.sh::https://github.com/werckme/werckmeister/releases/download/v${pkgver}/werckmeister-${pkgver}-Linux.sh")
sha256sums=('a739e76fbcbfe52a9b37f648003f864c0b234425de30c9fd185ad28d69b9ccd6')

package () {
  install -d "${pkgdir}/usr"
  chmod 755 ${pkgname}-${pkgver}.sh
  ./${pkgname}-${pkgver}.sh --prefix="${pkgdir}"/usr --exclude-subdir
  install -d "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -s /usr/share/licenses/common/GPL3/license.txt \
   "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  chmod 755 "${pkgdir}/usr/bin"
  chmod 755 "${pkgdir}/usr/include"
  chmod 755 "${pkgdir}/usr/lib"
  chmod 755 "${pkgdir}/usr/lib/cmake"
  chmod 755 "${pkgdir}/usr/lib/pkgconfig"
  chmod 755 "${pkgdir}/usr/share"
}