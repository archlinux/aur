# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_sieve='sieve'
pkgname="thunderbird-${_sieve}"
_pkgver='0.2.3'
pkgver="${_pkgver}k"
pkgrel='4'
pkgdesc='This Extension implements the ManageSieve protocol for securely managing Sieve Script on a remote IMAP server'
arch=('any')
url="https://github.com/thsmi/${_sieve}"
license=('AGPL')
depends=('thunderbird')
source=("${url}/releases/download/${pkgver}/${_sieve}-${pkgver}.xpi")
sha256sums=('c96de2e447b8f3668c6d6d99313a102d67bad5594c3edec81a7d1e6ad9a15596')
noextract=("${source[@]%%::*}")

package() {
  cd "${srcdir}"
  install -Dm0644 "${_sieve}-${pkgver}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_sieve}@mozdev.org.xpi"
}
