# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=feluda
pkgname=${_basename}-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="Detect license usage restrictions in your project"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/anistark/${_basename}"
license=('MIT')

conflicts=("${_basename}")
provides=("${_basename}")

depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('tar')

source_x86_64=("${_basename}-${arch[0]}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_basename}-v${pkgver}-${_barch[0]}.deb")
source_aarch64=("${_basename}-${arch[1]}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_basename}-v${pkgver}-${_barch[1]}.deb")
sha256sums_x86_64=('3e761e204c21c7a7aa4e30e543786aea3ed7a78b1c5a2023c3cbddb33bd376ce')
sha256sums_aarch64=('5f89367312cbd67421866d61ba7d9bf751d4320ff2d7ed46bb0498aff8784847')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
