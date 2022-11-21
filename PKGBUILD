# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=kubie
pkgname=${_pkgname}-bin
pkgver=0.19.1
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
  '6128b0bd1281665739e215ed820d84f8eb2d15869b754e654bbf2053399dd875e97d753062d9a2ea161f0919fb94b16793d1a5c4d9e173ef1d2bbbbbc83a53fa'
  '2e932767e4c016c9e2222d2e24f0e3eb3b0d398fb5f0d60dd3287433d55787d33d7423beb7fb3fb5a44ac41e899627419d1f1b263ad587c8bf54532bb0ad6bb2'
  'a6060aadce3bfa8c4e8ef260f0198ad959feeab81148fad4ef8fd3b36383e8f1c5e7d148c2ad1af3ef31e6e462d9c4179620c767fcc7e65b9c10fa6b8b02d253'
  '63c6f25e01c94602e2d986549154d91d14c957d3e99e16e955bc79f53b97805d973185f73c86004c201f56418e47228538fdcd039fbc8a586cdf761236e14fde'
)

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "${_pkgname}-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
