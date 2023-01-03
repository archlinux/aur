# Maintainer: Can Ozokur <canozokur[at]gmail[dot]com>
pkgname=beyond-identity-bin
_pkgname=beyond-identity
pkgver=2.71.0_0
_pkgver=2.71.0-0
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
sha512sums=('67afaba3aa64923c4712514823ee6090f277a388060d604ca8ed79a99a31f0b066739a7049899181fc6dd1ecdeb25a0fa241be6177ffd1128dda388b8ec284f9')

package() {
  cp -R "${srcdir}/etc" "${pkgdir}/etc"
  cp -R "${srcdir}/opt" "${pkgdir}/opt"
  cp -R "${srcdir}/usr" "${pkgdir}/usr"
}
