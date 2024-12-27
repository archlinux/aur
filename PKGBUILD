# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="RadioGoGo"
_pkgname="${_name,,}"
pkgname="${_pkgname}-bin"
pkgver=0.3.2
pkgrel=1
pkgdesc="Go-powered CLI to surf global radio waves via a sleek TUI."
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/matteo-pacini/${_name}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.zip")
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_386.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm.zip")
sha256sums=('a97e241f232d9be3a8a8ed8241b03e3e8cb977d7a9f5f2d4dc79a8c4a590df34'
            '4540d32521736ca767f366cf07d64fefa02d9fe93b7e30e42925a00b9a7e2f7c')
sha256sums_x86_64=('567f711a98cf38325ec9d37507f7e6dcf878f7eeb916ccde28408c4ae45e422e')
sha256sums_aarch64=('36e60e76f8e0bd69fe3689c71bba373e200277ea37b61d301f6b32fd04173789')
sha256sums_i686=('b7c73a5928a0891d07f03e9a52ff0009b39a1bd5628de69628fd31b1c0535bd3')
sha256sums_armv7h=('808f2275f87a0b84210e38dd6874d7530df485a89f5464bac97f727e0086829e')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
