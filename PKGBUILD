# Maintainer: Katie Hall <catmeow at complecwaft dot com>
# Contributor: James McMurray <jamesmcm03 at gmail dot com>
# Project Owner: Bruno Garcia <b at aduros dot com>

_pkgname="wasm4"
pkgname=wasm4-nightly-bin
_binname_artifact=wasm4-linux
_binname=w4
pkgver=20250917T154256Z
pkgrel=1
pkgdesc='Build retro games using WebAssembly for a fantasy console (nightly build)'
arch=('x86_64')
url='https://github.com/aduros/wasm4'
license=('ISC')
depends=('npm')
source=("${_pkgname}-nightly.zip::https://nightly.link/aduros/wasm4/workflows/build/main/w4.zip" "https://raw.githubusercontent.com/aduros/wasm4/main/LICENSE.txt")
sha256sums=('SKIP' 'SKIP')
provides=('wasm4' 'wasm4-bin')
conflicts=('wasm4' 'wasm4-bin')
options=('!strip')

pkgver() {
  printf "%s" "$(date -u '+%Y%m%dT%H%M%SZ')"
}

package() {
  install -Dm755 "${srcdir}/${_binname_artifact}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}"
}
