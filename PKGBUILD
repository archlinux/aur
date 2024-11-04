# Maintainer: Can Ozokur <canozokur[at]gmail[dot]com>
pkgname=beyond-identity-bin
_pkgname=beyond-identity
pkgver=2.100.2_0
_pkgver=2.100.2-0
pkgrel=1
pkgdesc="Beyond Identity Linux authenticator (official binary)"
arch=('x86_64')
url="https://app.byndid.com/downloads"
license=('custom: commercial')
depends=('gnome-keyring'
  'tpm2-tss'
  'openssl')
optdepends=('tpm2-abrmd'
  'tpm2-tools'
  'zenity: Receive desktop notifications')
backup=('etc/xdg/autostart/com.beyondidentity.endpoint.pgpauth.autostart.BeyondIdentity.desktop'
  'etc/xdg/autostart/com.beyondidentity.endpoint.webserver.autostart.BeyondIdentity.desktop')
provides=('beyond-identity')
conflicts=('beyond-identity')
install="${pkgname}.install"
source=("https://packages.beyondidentity.com/public/linux-authenticator/raw/versions/${_pkgver}/${_pkgname}-${_pkgver}.${CARCH}.tar.gz")
sha512sums=('9a72a97669065dcf2f691ceaef643ce0581c60f6cc44fa5d528d5bcf88392d44068bc64d91f2ae2568b2cdb432bff9475f04a219fe74d172d4f34ba5c07cde39')

package() {
  cp -R "${srcdir}/etc" "${pkgdir}/etc"
  cp -R "${srcdir}/opt" "${pkgdir}/opt"
  cp -R "${srcdir}/usr" "${pkgdir}/usr"
}
