# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sebastian Neef <aur @ gehaxelt DOT in>

# Neat idea but doesn't seem to work. Probably easy to fix.

set -u
_pkgname='ritx'
pkgname='perl-ritx'
pkgver='1.6'
pkgrel='1'
pkgdesc='discovers domains hosted on the same server as a given IP or domain'
arch=('any')
#url="https://code.google.com/p/${pkgname}/"
url='https://www.aldeid.com/wiki/RitX'
license=('GPL2')
depends=('perl')
source=("https://ritx.googlecode.com/files/RitX-Reverse-Ip-Tool-v${pkgver}.zip")
sha256sums=('01495ea9c5e18dc0eec31c90ef2321e73bf2b58408f44e08077c7136e8216010')

prepare() {
  set -u
  cd "${_pkgname}"
  sed -i -e 's:perl $b:$b:g' 'RitX.pl'
  set +u
}

package() {
  set -u
  cd "${_pkgname}"
  install -Dm755 'RitX.pl' "${pkgdir}/usr/bin/ritx"
  install -Dm644 'README' -t "${pkgdir}/usr/share/doc/ritx/"
  set +u
}
set +u
