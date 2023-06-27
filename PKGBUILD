# Maintainer : mrkmg <kevin@mrkmg.com>
# Contributor : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=meshroom-bin
pkgver=2023.2.0
pkgrel=3
pkgdesc="Meshroom is a free, open-source 3D Reconstruction Software based on the AliceVision framework."
arch=( 'x86_64')
url="https://github.com/alicevision/meshroom"
license=('MPL2')
groups=()
depends=('libgl')
optdepends=('cuda')
provides=('meshroom')
conflicts=('meshroom')
options=('!strip')

_extractedname='Meshroom-2023.2.0-av3.1.0-centos7-cuda11.3.1'
_downloadapp='Meshroom.html'
_filename='Meshroom-2023.2.0-linux.tar.gz'
_srcurl="$(python fosshub.py ${_downloadapp} ${_filename})"
source=(
  ${_srcurl}
  'Meshroom'
  'meshroom_photogrammetry'
  'Meshroom.png'
  'Meshroom.desktop'
  'meshroom_compute'
)

sha256sums=('47efa69780bfe83bc24932a713340e81916084b79850445e65e205fd2b632fa6'
            '5efd9924e4b0cea03ec24c797bd909fc20abcf6fb9449b2e4305d8b416372df0'
            '6b8826602092d3c7d28fd1762b23b30aa4cd1c12826440168ddf003a32b6b805'
            'a24e45c707c8e0689f2f1b7952f652e824b7c55e159f4c4a0421fabd428cdf5e'
            'b3c1a11f6fa397a0f7303272692999809df69e9c1d83ddac95d88243b3eff6a3'
            '4eb1b55dac5c9d276383ea1fdd8580fc611184937b845da20d25b67610039fa8')
package() {
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  cp -r ${srcdir}/${_extractedname}/* ${pkgdir}/usr/share/${pkgname}/
  install -m644 ${srcdir}/Meshroom.png ${pkgdir}/usr/share/${pkgname}/Meshroom.png
  install -m755 ${srcdir}/Meshroom ${pkgdir}/usr/bin/Meshroom
  install -m755 ${srcdir}/meshroom_photogrammetry ${pkgdir}/usr/bin/meshroom_photogrammetry
  install -m755 ${srcdir}/meshroom_compute ${pkgdir}/usr/bin/meshroom_compute
  install -m755 ${srcdir}/Meshroom.desktop ${pkgdir}/usr/share/applications/Meshroom.desktop
}
