# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_sieve='sieve'
pkgname="thunderbird-${_sieve}"
_pkgver='0.2.3'
pkgver="${_pkgver}k"
pkgrel='3'
pkgdesc='This Extension implements the ManageSieve protocol for securely managing Sieve Script on a remote IMAP server'
arch=('any')
url="https://github.com/thsmi/${_sieve}"
license=('AGPL')
depends=('thunderbird')
makedepends=('git' 'zip')
source=("${_sieve}::git+${url}.git")
sha256sums=("SKIP")
noextract=("${source[@]%%::*}")

build() {
  cd "${srcdir}/${_sieve}/src/${_sieve}@mozdev.org"
  zip -r "${srcdir}/${_sieve}/${_sieve}@mozdev.org.xpi" *
}

package() {
  cd "${srcdir}/${_sieve}"
  install -Dm0644 "${_sieve}@mozdev.org.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_sieve}@mozdev.org.xpi"
}
