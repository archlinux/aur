# Maintainer: Jacob Wang <jatcwang@gmail.com>

pkgname=jdk-mission-control-bin
pkgver=9.0.0
pkgrel=1
pkgdesc="OpenJDK Mission Control"
arch=('x86_64')
license=('UPL')
url="https://adoptopenjdk.net/jmc"
depends=('java-environment>=11')
optdepends=()
options=(!strip)
source=(
  "https://github.com/adoptium/jmc-build/releases/download/${pkgver}/org.openjdk.jmc-${pkgver}-linux.gtk.x86_64.tar.gz"
  "jdk-mission-control.desktop"
)
sha512sums=(
  '6ce06081ead6d752428b318e6052179eef881af5dac44a5ffbe7de406772433134f5f202a66aee2ebff6ec425b9c1fe1181591bcbca302dd43f9e4fababaf9c1'
  'af6dbb956d9e522919d90029a1b147e79e9003e32042bbaba9535923682144b169e3fb7106a4b557c05f9b257efc0bdd221e33608bcdae9bbee5bf74f84ae5de'
)

package() {
   local LIBDIR="${pkgdir}/opt/jdk-mission-control"
   install -dm 755 "$LIBDIR"
   cp -r "JDK Mission Control"/* "$LIBDIR"
 
   install -dm 755 "${pkgdir}/usr/bin"
   ln -sf "/opt/jdk-mission-control/jmc" "${pkgdir}/usr/bin/jmc"
 
   install -D -m644 "jdk-mission-control.desktop" \
       "${pkgdir}/usr/share/applications/jdk-mission-control.desktop"
 
   install -dm 755 "${pkgdir}/usr/share/licenses"
   cp -r legal "${pkgdir}/usr/share/licenses/jmc"
}
