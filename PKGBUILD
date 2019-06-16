# Maintainer : David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.1
pkgrel=1
pkgdesc="A YouTube desktop application"
arch=('x86_64')
url='https://flavio.tordini.org/minitube'
license=('GPL3')
depends=('mpv' 'qt5-declarative' 'qt5-x11extras')
makedepends=('qt5-tools')
source=("https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('a72b237affb51a23e7bc004323854722e4774856d3c80e7058a675ad165ad3577f2cd029037b7ab46756ff15cdc5f9573ed11bc9ff6645c380d159558eba273f')

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
