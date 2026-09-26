# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=feluda
pkgname=${_basename}-bin
pkgver=1.17.0
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
sha256sums_x86_64=('f58b3625cdaef9aeaa0fe85ed67c3c47a226f8858ff7f79e6f9bf5db11eb6dba')
sha256sums_aarch64=('e5a2cd6483af16249d28efd993bb2a3f2d2e23a21baf47fbb894b0d2ce9c92bd')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
