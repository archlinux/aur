# Maintainer : David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.9
pkgrel=3
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('x86_64')
url='https://flavio.tordini.org/minitube'
license=('GPL3')
depends=('phonon-qt5' 'qt5-declarative' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flaviotordini/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('94bac1b7cb1b3388256d088bfb9ffdfe75cc3c1624f60722cedd561015e1afa96351d4ac55b6be27bb5e00641cd7e3198cf2285a0e9b0c586d62d1a7a8c510c9')

build() {
  cd "${pkgname}-${pkgver}"
  qmake
}

package() {
  cd "${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}/"
}
