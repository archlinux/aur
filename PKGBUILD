# Maintainer: Tero Vierimaa <tero.vierimaa-at-iki.fi>
_pkgname=jellycli

pkgname=${_pkgname}-bin
pkgdesc="Terminal music player for Jellyfin & Subsonic media servers"
pkgver=0.9.1
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
    55bb10e7dee2d56ee642e0f1007a0d24ed49dc1f2e7650e60478b4c7f7f5c6a6
)

package() {
    cd "${srcdir}"
    install -Dm755 ${_binname} ${pkgdir}/usr/bin/${_pkgname}
}

