# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=feluda
pkgname=${_basename}-bin
pkgver=1.12.0
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
sha256sums_x86_64=('148d3065209aab04d4b6d4554ebc0f2c5f3728c14592109a8f4344cdb5adc5bb')
sha256sums_aarch64=('6dd23422e6b98d320985d8518b17698892cc9efa771c04d3575fe3c64ecaf83c')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
