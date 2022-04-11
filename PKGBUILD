# Maintainer: Jacob Wang <jatcwang@gmail.com>

pkgname=jdk-mission-control-bin
pkgver=8.2.0
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
  '0c760e6f5c715769667891c987749332d495d9c19ec668ab688817f6101c0f57b1819e93d76635b27322fe44a76e086fcb0164fec3dec5a6a0ef988a376a4dd8'
  '5a62b0a0f5dee80543575005c43b3dfd368e60efd1cdf41dca0b5c201a11748773855c1259f930bb4f0a573b10025c6f7b281014e36b00dee809a8a5ef9bac4c'
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
