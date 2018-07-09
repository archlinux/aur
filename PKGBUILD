# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: timetrap <timetrap@gmail.com>
# Contributor: SpookyET <spookyet@gmail.com>

set -u
pkgname='bcwipe'
_pkgver='1.9-13'
pkgver="${_pkgver//-/.}"
pkgrel='1'
pkgdesc='Securely erase data from magnetic and solid-state memory'
arch=('i686' 'x86_64')
url='https://www.jetico.com/download'
license=('unknown')
_srcdir="${pkgname}-${_pkgver}"
source=("https://www.jetico.com/linux/BCWipe-${_pkgver}.tar.gz")
md5sums=('b2372f6f3a3ce969d51bea7a876907c2')
sha256sums=('9df8cebf07dc38c53c76728c428d4b180b7cb2479f69a7d6965f99fcb1b2cfc2')

build() {
  cd "${_srcdir}"

  ./configure --prefix='/usr'

  nice make root="${pkgdir}"
}

package() {
  cd "${_srcdir}"

  make DESTDIR="${pkgdir}" install
}
set +u

# vim:set ts=2 sw=2 et:
