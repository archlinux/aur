#
# PKGBUILD: pick
#
# Maintainer: Uffe Jakobsen < uffe@uffe.org >
# Contributor: Calle Erlandsson <calle@calleerlandsson.com>

pkgname=pick
pkgver=4.0.0
pkgrel=1
pkgdesc='A fuzzy search tool for the command line'
arch=('i686' 'x86_64')
url='https://github.com/mptre/pick'
license=('MIT')
depends=('ncurses')
source=("https://github.com/mptre/pick/releases/download/v${pkgver}/pick-${pkgver}.tar.gz")
sha256sums=('de768fd566fd4c7f7b630144c8120b779a61a8cd35898f0db42ba8af5131edca')


build()
{
  cd "${pkgname}-${pkgver}"
  #./configure --prefix=/usr
  PREFIX=/usr ./configure
  make
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR="/usr/share/man" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

#
# EOF
#
