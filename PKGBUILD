# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_sieve='sieve'
pkgname="thunderbird-${_sieve}"
pkgver="0.3.0"
pkgrel='1'
pkgdesc='This Extension implements the ManageSieve protocol for securely managing Sieve Script on a remote IMAP server'
arch=('any')
url="https://github.com/thsmi/${_sieve}"
license=('AGPL')
depends=('thunderbird')
source=("${url}/releases/download/${pkgver}/${_sieve}-${pkgver}.xpi")
sha256sums=('6f0545de23d928cf84044d1305b7a5e40145364318469d388695b02c18824052')
noextract=("${source[@]%%::*}")

package() {
  cd "${srcdir}"
  install -Dm0644 "${_sieve}-${pkgver}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_sieve}@mozdev.org.xpi"
}
