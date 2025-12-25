# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=feluda
pkgname=${_basename}-bin
pkgver=1.11.0
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
sha256sums_x86_64=('16338844953a4ddb9f6b05c3e41eb6144185cb66261e8ce4fc468bc93726e640')
sha256sums_aarch64=('57deecc7a1518bb78e66245fcce3e2cc73057bf9d418f404c7014a214e17a664')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
