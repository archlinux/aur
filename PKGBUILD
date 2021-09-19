# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=kubie
pkgname=${_pkgname}-bin
pkgver=0.15.1
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
  '567477b7f3ac2c7f7f614dcc3ec2ebfab4bde09e08e9bbf643eaed582a59c14dad62657a7d6a9c18879c31b6a0e148c9f2ac2dde4743d3ca70f4c8ae33b9077a'
  '2e932767e4c016c9e2222d2e24f0e3eb3b0d398fb5f0d60dd3287433d55787d33d7423beb7fb3fb5a44ac41e899627419d1f1b263ad587c8bf54532bb0ad6bb2'
  '63c6f25e01c94602e2d986549154d91d14c957d3e99e16e955bc79f53b97805d973185f73c86004c201f56418e47228538fdcd039fbc8a586cdf761236e14fde'
)

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
}
