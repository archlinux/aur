# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=wasmrun
pkgname=${_basename}-bin
pkgver=0.15.2
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
sha256sums_x86_64=('a2562e76a095859357fbabb97754f6df3ef88ccb0320c5cf255d81c2afe09323')
sha256sums_aarch64=('451599f7e8d70702a156c9799a625613eddfcb1e88753ac0b2b31d475d77f4e8')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
