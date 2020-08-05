# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# URL: https://github.com/michaelbeaumont/aur-packages
_pkgname=dijo
pkgname=${_pkgname}-bin
pkgdesc="Scriptable, curses-based, digital habit tracker"
pkgver=0.2.3
pkgrel=1
arch=(x86_64)
_repo=NerdyPepper/dijo
url="https://github.com/${_repo}"
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}-git")
license=(MIT)
depends=(gcc-libs)
_binname="${_pkgname}-${pkgver}-${arch}"
source=(
  "${_binname}::${url}/releases/download/v${pkgver}/${_pkgname}-$arch-linux"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/${_repo}/v${pkgver}/LICENSE"
)
sha256sums=(
  f1cb407a18dc6078f2cfd9bf2cf20b276224c7c6a9926cd11aa3178748abc53a
  fd1dd686de8dc3d27fae79efdf74656b6237aa948296d6a2fe55bdc18b7cc9e1
)

package() {
    install -dm755 "$pkgdir/usr/share/licenses/${pkgname}/"
    cd "${srcdir}"
    install -m644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 ${_binname} ${pkgdir}/usr/bin/${_pkgname}
}
