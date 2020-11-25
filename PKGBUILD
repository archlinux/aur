# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='jiq'
pkgname="${_pkgname}-bin"
pkgver=0.7.1
pkgrel=1
pkgdesc='Interactive JSON query tool using jq expressions'
arch=('x86_64')
url='https://github.com/fiatjaf/jiq'
license=('MIT')
depends=('jq')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}-readme::${url}/raw/${pkgver}/README.md"
        "${_pkgname}-${pkgver}-license::${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/${pkgver}/jiq_linux_amd64")
sha256sums=('79cd745c733c8bc29256deac1b4a69aa1836ec4baf820f968602154737578b09'
            'b16f705d2788074503d280681d4be9c7a1aaa720b954807f1a3f03f5098d63dc')
sha256sums_x86_64=('73c81a91ff187b338350cca008d291aebe8a4328747caf2020fc94bd20cc086d')

package() {
  install -Dvm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 "${_pkgname}-${pkgver}-readme" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 "${_pkgname}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
