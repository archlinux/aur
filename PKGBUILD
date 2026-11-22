# Maintainer: Isaac Castro <isaacangello@inf.ufpel.edu.br>

pkgname=mintme-wallet-bin
_pkgname=mintme-wallet
pkgver=1.2.0
pkgrel=1
pkgdesc='MintMe Coin desktop wallet (prebuilt Electron 33 binary)'
arch=('x86_64')
url='https://github.com/mintme-com/wallet'
license=('MIT')
depends=('alsa-lib' 'gtk3' 'nss')
provides=('mintme-wallet')
conflicts=('mintme-wallet')
options=('!strip')
source=(
  "${_pkgname}-${pkgver}-electron33-linux-x86_64.tar.zst::https://github.com/isaacangello/wallet/releases/download/v${pkgver}-electron33/${_pkgname}-${pkgver}-electron33-linux-x86_64.tar.zst"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
  "${_pkgname}.svg"
  'LICENSE.MIT'
)
sha256sums=(
  '59629bd4de1bff52346d19167234988510c3273d806ec208cabd7798adfbc9f7'
  'ed871b8db638b0921b4d47c372f3dbd94e9fdc567e35ee20ab46bd8598f400a5'
  '65911602ad1026682a5bf9095b60a5d37bfc456676f624997e1f6bf57e29d047'
  '949e9caa8a25a91a850b611779048cccdbe83c0319007d14fd6372b2a621601a'
  '1b0a4ebe6200441fe008bba2b60bb227b944cd77427b3f9c60f6f7e32120a65d'
)

package() {
  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -a "${srcdir}/${_pkgname}/." "${pkgdir}/usr/lib/${_pkgname}/"

  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -Dm644 "${srcdir}/LICENSE.MIT" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
