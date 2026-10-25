# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=feluda
pkgname=${_basename}-bin
pkgver=1.18.0
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
sha256sums_x86_64=('381775c29f986c281715a195662ef6331976294b677ea59a0e8553590e492786')
sha256sums_aarch64=('ec3ae3231113e0847ba76c9f8af6e0d30891efdd91da5ed61617fadd2d096491')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
