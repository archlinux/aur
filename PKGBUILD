# Maintainer: Jacob Wang <jatcwang@gmail.com>

pkgname=jdk-mission-control-bin
pkgver=9.1.1
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
  'cff7deb6077a9785083b6fd8fd3f59af5a26f4e4f84b42239a9019f4847de6b97c145f3b41bdef03d398f68e570cbdbd11867f3b3a440de8bc558edd5c4ba59e'
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
