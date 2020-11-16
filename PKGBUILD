# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_sieve='sieve'
pkgname="thunderbird-${_sieve}"
pkgver="0.5.3"
pkgrel='1'
pkgdesc='This Extension implements the ManageSieve protocol for securely managing Sieve Script on a remote IMAP server'
arch=('any')
url="https://github.com/thsmi/${_sieve}"
license=('AGPL')
depends=('thunderbird')
source=("${url}/releases/download/${pkgver}/${_sieve}-${pkgver}.xpi")
sha256sums=('60daabbe67f6cc5f4f41a9952fdf43884b5fd304b6070a6fd04e8707fdf2ba0e')
noextract=("${source[@]%%::*}")

package() {
  cd "${srcdir}"
  install -Dm0644 "${_sieve}-${pkgver}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_sieve}@mozdev.org.xpi"
}
