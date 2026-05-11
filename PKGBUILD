# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=pam_authelia-bin
_pkgname=pam_authelia
pkgver=0.1.1
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

sha256sums_x86_64=('69c88bf40eb13c8ced54adf8b12b7fd78961d32367c9ce4d02219bf88bd93dd0')
sha256sums_aarch64=('00c8d7448813dec26c54d45541bccd77f25a04d218d482b284dd41e0be150e3d')
sha256sums_armv7h=('17a4890e491c866275f6e0fcd75f9af686b0455d0a5fddd69147b4be9b95f153')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}.so" "${pkgdir}/usr/lib/security/${_pkgname}.so"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
