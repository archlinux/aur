# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Siavash Askari Nasr <ciavash@proton.me>

_pkgname="gex"
pkgname="${_pkgname}-bin"
pkgver=0.6.4
pkgrel=2
pkgdesc="Git Explorer: cross-platform git workflow improvement tool inspired by Magit"
arch=('x86_64')
url="https://codeberg.org/Piturnah/${_pkgname}"
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc' 'zlib')
optdeepnds=('git: for yet unimplemented commands')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz"
        "${_pkgsrc}-CHANGELOG.md::${url}/raw/tag/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-LICENSE-APACHE-2.0::${url}/raw/tag/v${pkgver}/LICENSE-APACHE"
        "${_pkgsrc}-LICENSE-MIT::${url}/raw/tag/v${pkgver}/LICENSE-MIT"
        "${_pkgsrc}-README.md::${url}/raw/tag/v${pkgver}/README.md")
b2sums=('3439401634f63912e69a5eabc349433fc9985a322d032fb8971e44be6a66bf07fdd746cd1fec683e7648b1ae3e0cb5a00d49147228a15d67bc6aa57e2615c1c9'
        '1e1f11d0d37deab8e63237b2cadf32c935e9c40578df0f6f8da11da25a021de895a0462d482e98d09b9ce47419b98b7067178d8bf48440b475509ef2f128207c'
        'b2c2b7fe20ab6c3a03ef3226543c2aeaa231f56df7a8b74aab4d6499bc7a9e371ea3d87ac5b0e474bbe7b1516616ebdea8bd0edd0a30477c5b89bb4ce0a9ea0f'
        '2befde3c26587ae636fdff094e32c9849d9bbe8169c9474f36f23c62b281edaebf58eaf10ada98f093c1b2f4a3cb6d633a026bb05322fccb2caf0b873226733e'
        '1fc981ac384b0d19968f6e38f5f89ae06b09fe7cb5e71f69810084c89f8f1b6070fb0104d39a655d3704a39c2cf8ace6dc93ff6ba3f0f95f5d9bea705b0799a4')

package() {
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE-2.0" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
