# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=pam_authelia-bin
_pkgname=pam_authelia
pkgver=0.1.2
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

sha256sums_x86_64=('32f9a6a1b65a6423a71d46015b35b9bc82f2d7aec587fab401631e64477b674d')
sha256sums_aarch64=('3af4d047ef5e24bdc72bc96e601f2e050af9ec2d7f742a17937ae28a05c79d8b')
sha256sums_armv7h=('36b422f45c19580adb67a12dfe8e84c49208189336b2be8e68fc9f9a9843f813')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}.so" "${pkgdir}/usr/lib/security/${_pkgname}.so"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
