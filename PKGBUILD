# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=wasmrun
pkgname=${_basename}-bin
pkgver=0.20.0
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
sha256sums_x86_64=('02cb964b218c25ca9602c675bdf5d471645e429be385054cbd636b8f3348112e')
sha256sums_aarch64=('3d129b1a746309875b04cc23a0af6eb9d2429c472c3e07f6091bf511c76a3353')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
