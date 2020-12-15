# Maintainer: Tero Vierimaa <tero.vierimaa-at-iki.fi>
_pkgname=jellycli

pkgname=${_pkgname}-bin
pkgdesc="Terminal music player for Jellyfin media server"
pkgver=0.8.1
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
    1a61eaa6e098b1dd40afbc1084a021b9a5b7da5c7878d773e2743ad2c7f2d3d2
)

package() {
    cd "${srcdir}"
    install -Dm755 ${_binname} ${pkgdir}/usr/bin/${_pkgname}
}

