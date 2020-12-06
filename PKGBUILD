# Maintainer: Tero Vierimaa <tero.vierimaa-at-iki.fi>
_pkgname=jellycli

pkgname=${_pkgname}-bin
pkgdesc="Terminal music player for Jellyfin media server"
pkgver=0.8.0
pkgrel=1
arch=(x86_64)
_repo=tryffel/jellycli

url="https://github.com/${_repo}"
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}-git")
license=(GPL-v3)
depends=('alsa-lib')
_binname="${_pkgname}-${pkgver}-${arch}"
source=(
  "${_binname}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_$arch"
)

sha256sums=(
    f53421ce5cee0008c8664d9e7970b940b542afd00980a2c5b5932c3a642a90c9
)

package() {
    cd "${srcdir}"
    install -Dm755 ${_binname} ${pkgdir}/usr/bin/${_pkgname}
}

