# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_sieve='sieve'
pkgname="thunderbird-${_sieve}"
pkgver="0.2.11"
pkgrel='1'
pkgdesc='This Extension implements the ManageSieve protocol for securely managing Sieve Script on a remote IMAP server'
arch=('any')
url="https://github.com/thsmi/${_sieve}"
license=('AGPL')
depends=('thunderbird')
source=("${url}/releases/download/${pkgver}/${_sieve}-${pkgver}.xpi")
sha256sums=('21db5060e4452b1142f8a98ac49c7e47fb6e26eceb7e2c7fe7d0b6b0d8297637')
noextract=("${source[@]%%::*}")

package() {
  cd "${srcdir}"
  install -Dm0644 "${_sieve}-${pkgver}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_sieve}@mozdev.org.xpi"
}
