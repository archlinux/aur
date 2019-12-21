# Maintainer : David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.3
pkgrel=1
pkgdesc="A YouTube desktop application"
arch=('x86_64')
url="https://flavio.tordini.org/minitube"
license=('GPL3')
depends=('mpv' 'qt5-declarative' 'qt5-x11extras')
makedepends=('qt5-tools')
source=("https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('8496405de0fdfb58a109c95004437fafea92013860ab5acbdd0aba983da7b6114e3c4a216f6b910df88740e688f57c2dc9640fe02630b256a309bc3c6e03ba8d')

build() {
  cd "${pkgname}-${pkgver}"
  qmake
}

package() {
  cd "${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}/"
  install -vDm 644 {AUTHORS,CHANGES,README.md,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
