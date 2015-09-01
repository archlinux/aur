# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Lucas de Sena <lucas DOT ta23 @ gmail DOT com>
# Contributor: Alexandre Dantas <eu @ alexdantas DOT net>

set -u
pkgname='nsnake'
pkgver='3.0.1'
pkgrel='2'
pkgdesc='Customizable Snake game with ncurses for the terminal'
arch=('x86_64' 'i686')
url='http://nsnake.alexdantas.net/'
license=('GPL3')
depends=('ncurses')
_url='https://github.com/alexdantas/nSnake'
_verwatch=("${_url}/releases" "${_url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${pkgname}-v${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('7240dafe35e17b01134591d7ae8f09f5a375cded8b01e43ba97ca3610a09ea61')

build() {
  set -u
  cd "${srcdir}/nSnake-${pkgver}"

  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${srcdir}/nSnake-${pkgver}"

  make DESTDIR="${pkgdir}" PREFIX='/usr' install
  set +u
}
set +u
