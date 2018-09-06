# Maintainer : mrkmg <kevin@mrkmg.com>
# Contributor : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=meshroom-bin
pkgver=2018.1.0
pkgrel=2
pkgdesc="Meshroom is a free, open-source 3D Reconstruction Software based on the AliceVision framework."
arch=('i686' 'x86_64')
url="https://github.com/alicevision/meshroom"
license=('MPL2')
groups=()
depends=('libgl')
makedepends=()
provides=('meshroom')

source=(
  'https://github.com/alicevision/meshroom/releases/download/v2018.1.0/Meshroom-2018.1.0-linux.tar.gz'
  'Meshroom'
  'meshroom_photogrammetry'
  'Meshroom.png'
  'Meshroom.desktop'
)

sha256sums=(
  '5400f7e7fa315dbcd139ad45085a97bc9f1a32f5120f2bdedad1802bb97d9acf'
  'ccfc665d6df6bb1b1d3f0490d7e83297c0ae2b7f7a90fb4cb28fdecd85a03feb'
  'a80575135fa438321dc743c95f64defb2c0ed664e30e76d43d42c14366e15eca'
  'a24e45c707c8e0689f2f1b7952f652e824b7c55e159f4c4a0421fabd428cdf5e'
  'b3c1a11f6fa397a0f7303272692999809df69e9c1d83ddac95d88243b3eff6a3'
)

package() {
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  cp -r ${srcdir}/Meshroom-${pkgver}/* ${pkgdir}/usr/share/${pkgname}/
  cp ${srcdir}/Meshroom.png ${pkgdir}/usr/share/${pkgname}/Meshroom.png
  cp ${srcdir}/Meshroom ${pkgdir}/usr/bin/Meshroom
  cp ${srcdir}/meshroom_photogrammetry ${pkgdir}/usr/bin/meshroom_photogrammetry
  cp ${srcdir}/Meshroom.desktop ${pkgdir}/usr/share/applications/Meshroom.desktop
}
