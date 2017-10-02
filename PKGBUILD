# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_sieve='sieve'
pkgname="thunderbird-${_sieve}"
_pkgver='0.2.3'
pkgver="${_pkgver}l"
pkgrel='1'
pkgdesc='This Extension implements the ManageSieve protocol for securely managing Sieve Script on a remote IMAP server'
arch=('any')
url="https://github.com/thsmi/${_sieve}"
license=('AGPL')
depends=('thunderbird')
source=("${url}/releases/download/${pkgver}/${_sieve}-${pkgver}.xpi")
sha256sums=('e8ca2f6824bb076c24dd3cc6c4fed2bc2d38733d2ddad6ca87a7c4e39f08b0e9')
noextract=("${source[@]%%::*}")

package() {
  cd "${srcdir}"
  install -Dm0644 "${_sieve}-${pkgver}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_sieve}@mozdev.org.xpi"
}
