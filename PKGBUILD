# Maintainer: Tero Vierimaa <tero.vierimaa-at-iki.fi>
_pkgname=jellycli

pkgname=${_pkgname}-bin
pkgdesc="Terminal music player for Jellyfin & Subsonic media servers"
pkgver=0.9.0
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
    33bef6d9ab247d4ef1ae1ef78d835a439266b5f1a77104c0a4b41a0a1aa61a0b
)

package() {
    cd "${srcdir}"
    install -Dm755 ${_binname} ${pkgdir}/usr/bin/${_pkgname}
}

