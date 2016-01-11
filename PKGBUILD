# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Stuart Mumford <stuart at cadair dot com>
# Contributor: Maximilian Berger <snowdragon92 at gmail dot com>
pkgname=paraview-bin
_PkgName=ParaView
pkgver=5.0.0
pkgrel=1
pkgdesc="ParaView is an open-source, multi-platform data analysis and visualization application"
arch=('x86_64')
url="http://www.paraview.org/"
license=('custom')
source=("http://www.paraview.org/files/v${pkgver:0:3}/${_PkgName}-${pkgver}-Qt4-OpenGL2-MPI-Linux-64bit.tar.gz"
        'https://gitlab.kitware.com/paraview/paraview/raw/master/License_v1.2.txt')
sha256sums=('4c3c0e40aeea8d34d58696b08f5306e29a205259f5f3503e4493d2bc7f73e445'
            'd2b1ab821f9b09f99c2b8ddb50438e1a0a7bae18bbb00e6a8962fb57ec64a197')
conflicts=('paraview')
provides=('paraview')
depends=('shared-mime-info' 'gtk-update-icon-cache' 'desktop-file-utils')
install=${pkgname}.install

package() {
  # Install everything
  cp -r "${srcdir}/${_PkgName}-${pkgver}-Qt4-OpenGL2-MPI-Linux-64bit" "${pkgdir}/usr"

  # Move the doc to a more appropriate directory
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  # Install license
  install -Dm644 "License_v1.2.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
