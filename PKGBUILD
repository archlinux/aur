# Maintainer: Tero Vierimaa <tero.vierimaa-at-iki.fi>
_pkgname=jellycli

pkgname=${_pkgname}-bin
pkgdesc="Terminal music player for Jellyfin media server"
pkgver=0.6.0
pkgrel=1
arch=(x86_64)
_repo=tryffel/jellycli

url="https://github.com/${_repo}"
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}-git")
license=(Apache2)
depends=(gcc-libs)
_binname="${_pkgname}-${pkgver}-${arch}"
source=(
  "${_binname}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_$arch"
)

sha256sums=(
    e565fd117f2ff163fb01cf58f6c7b669544c97c5e1c2fa986ff8ad9d74e96793
)

package() {
    cd "${srcdir}"
    install -Dm755 ${_binname} ${pkgdir}/usr/bin/${_pkgname}
}

