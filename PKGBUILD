# Maintainer : mrkmg <kevin@mrkmg.com>
# Contributor : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=meshroom-bin
pkgver=2019.2.0
pkgrel=2
pkgdesc="Meshroom is a free, open-source 3D Reconstruction Software based on the AliceVision framework."
arch=('i686' 'x86_64')
url="https://github.com/alicevision/meshroom"
license=('MPL2')
groups=()
depends=('libgl')
makedepends=()
provides=('meshroom')
conflicts=('meshroom')
options=('!strip')

source=(
  'https://github.com/alicevision/meshroom/releases/download/v2019.2.0/Meshroom-2019.2.0-linux.tar.gz'
  'Meshroom'
  'meshroom_photogrammetry'
  'Meshroom.png'
  'Meshroom.desktop'
  'meshroom_compute'
)

sha256sums=('bdd741692161c234d27b3a8ce7109071c99bbe6c30b04d8108675a19f160a93a'
            '5efd9924e4b0cea03ec24c797bd909fc20abcf6fb9449b2e4305d8b416372df0'
            '6b8826602092d3c7d28fd1762b23b30aa4cd1c12826440168ddf003a32b6b805'
            'a24e45c707c8e0689f2f1b7952f652e824b7c55e159f4c4a0421fabd428cdf5e'
            'b3c1a11f6fa397a0f7303272692999809df69e9c1d83ddac95d88243b3eff6a3'
            '4eb1b55dac5c9d276383ea1fdd8580fc611184937b845da20d25b67610039fa8')

package() {
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  cp -r ${srcdir}/Meshroom-${pkgver}/* ${pkgdir}/usr/share/${pkgname}/
  cp ${srcdir}/Meshroom.png ${pkgdir}/usr/share/${pkgname}/Meshroom.png
  cp ${srcdir}/Meshroom ${pkgdir}/usr/bin/Meshroom
  cp ${srcdir}/meshroom_photogrammetry ${pkgdir}/usr/bin/meshroom_photogrammetry
  cp ${srcdir}/meshroom_compute ${pkgdir}/usr/bin/meshroom_compute
  cp ${srcdir}/Meshroom.desktop ${pkgdir}/usr/share/applications/Meshroom.desktop
}
