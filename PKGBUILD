# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# URL: https://github.com/michaelbeaumont/aur-packages
_pkgname=dijo
pkgname=${_pkgname}-bin
pkgdesc="Scriptable, curses-based, digital habit tracker"
pkgver=0.2.7
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
  319069fde6b430a75ce270cd0d53c08351b0f7abfe2c5d52a9b488927ee09005
  a5bbba07d9db1df1dcb7b7f9cf4e2de3f82baad797ae644a595d95c7b9a7f1ce
)

package() {
    install -dm755 "$pkgdir/usr/share/licenses/${pkgname}/"
    cd "${srcdir}"
    install -m644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 ${_binname} ${pkgdir}/usr/bin/${_pkgname}
}
