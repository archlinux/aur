# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="taierspeed-cli"
pkgname="${_pkgname}-bin"
pkgver=1.7.2
pkgrel=1
pkgdesc="A CLI for TaierSpeed. Test your network without a phone."
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/ztelliot/${_pkgname}"
license=(
  'LGPL-3.0-only'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
source_armv7h=("${_pkgsrc}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
sha256sums=('e5327d58bbba05ebd74c5d9763733b7046f444d468e2d182819967cf7b008284'
            'e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118')
sha256sums_aarch64=('2315b44ed71350e0b08ffca80514216a52fbc50ca81bf3f4a87b587d3df9503f')
sha256sums_armv7h=('70b03f72249015e04b456a81017999da7191e131ddf97c6e2833f2c12df12054')
sha256sums_x86_64=('845b98ca0a9fa72c68ff41eb3943d4a7d7341a8443a7bb425d647d01e0ea08b1')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
