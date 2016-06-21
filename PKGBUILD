# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Stuart Mumford <stuart at cadair dot com>
# Contributor: Maximilian Berger <snowdragon92 at gmail dot com>
pkgname=paraview-bin
_PkgName=ParaView
_pkgver=5.1.0
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="ParaView is an open-source, multi-platform data analysis and visualization application"
arch=('x86_64')
url="http://www.paraview.org/"
license=('custom')
source=("http://www.paraview.org/files/v${pkgver:0:3}/${_PkgName}-${_pkgver}-Qt4-OpenGL2-MPI-Linux-64bit.tar.gz"
        "https://gitlab.kitware.com/paraview/paraview/raw/v${_pkgver}/License_v1.2.txt")
sha256sums=('daf1b57855aa533babde277e78a3dfb13cee860fddb54e6073dd79200af7757c'
            'd2b1ab821f9b09f99c2b8ddb50438e1a0a7bae18bbb00e6a8962fb57ec64a197')
conflicts=('paraview')
provides=('paraview')

package() {
  # Install everything
  cp -r "${srcdir}/${_PkgName}-${_pkgver}-Qt4-OpenGL2-MPI-Linux-64bit" "${pkgdir}/usr"

  # Install license
  install -Dm644 "License_v1.2.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
