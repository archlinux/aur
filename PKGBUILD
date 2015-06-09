# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-pantheon-shell
pkgver=0.2.0
pkgrel=1
pkgdesc='Pantheon Shell plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-pantheon-shell'
license=('GPL3')
groups=('pantheon')
depends=('gnome-desktop' 'switchboard')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-pantheon-shell/freya/${pkgver}/+download/switchboard-plug-pantheon-shell-${pkgver}.tgz")
sha256sums=('291e425fbde9a0598f3e1336b29125de918e8c0f785a795c98726b6a952bd5d5')

build() {
  cd switchboard-plug-pantheon-shell-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-pantheon-shell-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
