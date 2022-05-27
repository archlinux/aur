# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=kubie
pkgname=${_pkgname}-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="A more powerful alternative to kubectx and kubens"
arch=('x86_64')
url="https://github.com/sbstp/kubie"
license=('ZLIB')
depends=('gcc-libs')
provides=('kubie')
_repo="sbstp/kubie"
source=(
  "${_pkgname}-${pkgver}::https://github.com/${_repo}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
  "${_pkgname}-${pkgver}.bash::https://raw.githubusercontent.com/${_repo}/v${pkgver}/completion/${_pkgname}.bash"
  "${_pkgname}-${pkgver}.fish::https://raw.githubusercontent.com/${_repo}/v${pkgver}/completion/${_pkgname}.fish"
  "LICENSE::https://raw.githubusercontent.com/${_repo}/v${pkgver}/LICENSE"
)
sha512sums=(
  '7e0c9b44a8abd6f67f32b2b821659df89d7fcbbe613610433d1d9218946a0d5c41845463c53d6d3d01869f1c40d337d4e832cf96285fbd174ed2bdcf9d15777f'
  '2e932767e4c016c9e2222d2e24f0e3eb3b0d398fb5f0d60dd3287433d55787d33d7423beb7fb3fb5a44ac41e899627419d1f1b263ad587c8bf54532bb0ad6bb2'
  '61a833d39fdbd95e00ff6ec65029e5ea8701966056a8f06a4a2bb6528b6990cbadec965d75cf4356d544db2f9cd9c6ff9b9a1ac783254ba51bcab681e7c6d059'
  '63c6f25e01c94602e2d986549154d91d14c957d3e99e16e955bc79f53b97805d973185f73c86004c201f56418e47228538fdcd039fbc8a586cdf761236e14fde'
)

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "${_pkgname}-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
