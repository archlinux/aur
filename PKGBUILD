# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=sindricad-beta
_pkgname=sindricad
pkgver=0.1.273
pkgrel=1
pkgdesc="Parametric CAD for 3D printing (rolling beta, official binary)"
arch=('x86_64')
url="https://github.com/MakerViking/sindricad"
license=('AGPL-3.0-only')
# Bundles its own Python runtime and prebuilt wheels,
# stripping breaks the bundled shared objects.
options=(!strip)
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=${pkgname}.install
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/beta/SindriCAD_${pkgver}_amd64.deb")
sha256sums=('c98e56880993ac72e53e2a4202a254bf9b8d9dd0e3c6928a79e57479ede36828')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}/"

  # Fix icon directory
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2" "${pkgdir}/usr/share/icons/hicolor/256x256"
}
