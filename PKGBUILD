# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=kubie
pkgname=${_pkgname}-bin
pkgver=0.12.1
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
  "LICENSE::https://raw.githubusercontent.com/${_repo}/v${pkgver}/LICENSE"
)
sha512sums=(
  '33e87808fa1878f4214dadad86bb319b2737e2497dcd7a56229112e1cdda646b23903f7c5963293223ce14abd5c0a65fabeb560a6a4a22ef3c009229d45a2a7d'
  'ed0127772b0bb063e072dec3d6fe204b396eb6f6d42bfa10e8e169baaa21dbcb7247a21f550b49b3f3e4081f147f16d7122aa5dcca19561f27db3901b208654d'
  '63c6f25e01c94602e2d986549154d91d14c957d3e99e16e955bc79f53b97805d973185f73c86004c201f56418e47228538fdcd039fbc8a586cdf761236e14fde'
)

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
}
