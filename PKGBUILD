# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=werckmeister-bin
pkgver=0.1.55
pkgrel=1
pkgdesc="An open source Sheet Music MIDI Compiler"
arch=('x86_64')
url="http://werckme.github.io"
license=('GPL3')
provides=('werckmeister')
depends=('lua'
         'jack'
         'alsa-lib')
source=("${pkgname}-${pkgver}.sh::https://github.com/werckme/werckmeister/releases/download/v${pkgver}/werckmeister-${pkgver}-Linux.sh")
sha256sums=('34adb67a1a35d488084da4afe55a97548ac37add5d7934bcba2b0c21388f92e0')

package () {
  install -d "${pkgdir}/usr"
  chmod 755 ${pkgname}-${pkgver}.sh
  ./${pkgname}-${pkgver}.sh --prefix="${pkgdir}"/usr --exclude-subdir
  chmod 755 "${pkgdir}/usr/bin"
  chmod 755 "${pkgdir}/usr/include"
  chmod 755 "${pkgdir}/usr/lib"
  chmod 755 "${pkgdir}/usr/lib/cmake"
  chmod 755 "${pkgdir}/usr/lib/pkgconfig"
  chmod 755 "${pkgdir}/usr/share"
  chown root:root -R "${pkgdir}"
}
