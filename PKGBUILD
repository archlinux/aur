# Maintainer: Can Ozokur <canozokur[at]gmail[dot]com>
pkgname=beyond-identity-bin
_pkgname=beyond-identity
pkgver=2.84.0_0
_pkgver=2.84.0-0
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
sha512sums=('2205b713a69f662d0aa97e03697d0a100f04d2f0553f21b7ee201d576edf9bce53491731c52945924501664b4416e52c90ba7f9324b5abd05f081170432b9c14')

package() {
  cp -R "${srcdir}/etc" "${pkgdir}/etc"
  cp -R "${srcdir}/opt" "${pkgdir}/opt"
  cp -R "${srcdir}/usr" "${pkgdir}/usr"
}
