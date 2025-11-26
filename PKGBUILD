# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=wasmrun
pkgname=${_basename}-bin
pkgver=0.14.0
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
sha256sums_x86_64=('a366e6708b5d9c681549444da5cc60fa6cbb60b85d8d2589227da9b829e0d60b')
sha256sums_aarch64=('cb7f2213f8cd30896d60b0d348daf52c3d2bc5cfe3b687fcbf8e3a1fa33cfa5c')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
