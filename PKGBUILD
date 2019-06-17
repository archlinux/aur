#
# PKGBUILD: pick
#
# Maintainer: Uffe Jakobsen < uffe@uffe.org >
# Contributor: Calle Erlandsson <calle@calleerlandsson.com>

pkgname=pick
pkgver=3.0.1
pkgrel=2
pkgdesc='A fuzzy search tool for the command line'
arch=('i686' 'x86_64')
url='https://github.com/calleerlandsson/pick'
license=('MIT')
depends=('ncurses')
source=("https://github.com/calleerlandsson/pick/releases/download/v${pkgver}/pick-${pkgver}.tar.gz")
sha256sums=('668c863751f94ad90e295cf861a80b4d94975e06645f401d7f82525e607c0266')


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
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

#
# EOF
#
