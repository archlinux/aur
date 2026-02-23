# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=wasmrun
pkgname=${_basename}-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="Run WebAssembly instantly in your browser with a single command"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/anistark/${_basename}"
license=('MIT')

conflicts=("${_basename}")
provides=("${_basename}")

depends=('glibc' 'gcc-libs')
optdepends=('wasm-pack')
makedepends=('tar')

source_x86_64=("${_basename}-${arch[0]}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_basename}-v${pkgver}-${_barch[0]}.deb")
source_aarch64=("${_basename}-${arch[1]}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_basename}-v${pkgver}-${_barch[1]}.deb")
sha256sums_x86_64=('2b5b71bf3ff079271b2afe6c435a0407ab276b550c2bdadd1b1e40f3ab373f48')
sha256sums_aarch64=('ddb2382cf392bc1d500cd56d97634edcf17ad4392fc2a31f6da73d3d3d88bb28')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
