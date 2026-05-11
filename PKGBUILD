# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=pam_authelia-bin
_pkgname=pam_authelia
pkgver=0.1.0
pkgrel=1
pkgdesc="PAM module that delegates authentication (including 2FA) to an Authelia server. Pre-compiled."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/authelia/pam"
license=('Apache-2.0')
depends=('pam')
provides=("${_pkgname}")
conflicts=(
  "${_pkgname}"
  "${_pkgname}-git"
)

source_x86_64=("https://github.com/authelia/pam/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/authelia/pam/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
source_armv7h=("https://github.com/authelia/pam/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm.tar.gz")

sha256sums_x86_64=('8ea6dd93bbb57de209823bcf089bfae535391cedd407c7e674cd60e29c860f1d')
sha256sums_aarch64=('4bbd57d3248b2573dd6c37e22a4503f27efe6c008b7e8cd0fd63b1c584a2d7cb')
sha256sums_armv7h=('4858886ad5bd7ba9f672c88bdd81cc10749f1c3d6d91d8f2172d66f6409f9e16')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}.so" "${pkgdir}/usr/lib/security/${_pkgname}.so"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
