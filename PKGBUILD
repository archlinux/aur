# Maintainer: Can Ozokur <canozokur[at]gmail[dot]com>
pkgname=beyond-identity-bin
_pkgname=beyond-identity
pkgver=2.77.0_0
_pkgver=2.77.0-0
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
sha512sums=('3394619996cc07a4ead47a4622193de5e877fdb5c81e9ee255883d6c603b7ca0e0882542cad853795568fb0ddea1d335840347261d4c7eb2984982a411288a8b')

package() {
  cp -R "${srcdir}/etc" "${pkgdir}/etc"
  cp -R "${srcdir}/opt" "${pkgdir}/opt"
  cp -R "${srcdir}/usr" "${pkgdir}/usr"
}
