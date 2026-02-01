# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=wasmrun
pkgname=${_basename}-bin
pkgver=0.15.0
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
sha256sums_x86_64=('11a5cab7e91d7431acea14d5ed2f007f5fa05c7fdef2d5967e34b7da75950c83')
sha256sums_aarch64=('19a554f79d017c2159a6c7b283eb94cb66d4fabc43d23620bc2d73e5b1a546ed')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
