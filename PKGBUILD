# Maintainer:  Javier Tia <javier.tia@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=qcheckers
pkgver=0.9.0
pkgrel=2
pkgdesc="Qt version of the classic boardgame checkers (draughts)"
arch=('x86_64')
url='https://github.com/portnov/qcheckers'
license=('GPL')
depends=('qt5-base' 'qt5-svg')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('95faed6be55db1c0dfbe683bc59aab8c7ad1cb24f8ecc6ba8e0baff1a7c61c65')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake PREFIX=/usr INSTALL_ROOT="${pkgdir}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr INSTALL_ROOT="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
