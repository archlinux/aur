# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calculator
pkgver=0.1
pkgrel=1
pkgdesc='The Pantheon Calculator'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-calculator'
license=('GPL3')
groups=('pantheon')
depends=('granite-bzr')
makedepends=('cmake' 'vala')
install='pantheon-calculator.install'
source=("https://launchpad.net/pantheon-calculator/freya/${pkgver}/+download/pantheon-calculator-${pkgver}.tgz")
sha256sums=('41255cd0b04e3625cde11052c53feb5deae7241c0907dc25a4cf91351ae4b432')

build() {
  cd pantheon-calculator-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd pantheon-calculator-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
