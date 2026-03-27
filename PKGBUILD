# Maintainer: robertfoster

pkgname=whatsie
pkgver=5.0.0 # renovate: datasource=github-tags depName=keshavbhatt/whatsie
pkgrel=1
pkgdesc="Fast Light weight WhatsApp Client based on Qt's WebEngine, With lots of settings and packed goodies"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/keshavbhatt/whatsie"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-location' 'qt6-webchannel' 'qt6-webengine')
makedepends=('qt6-base')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cmake -S "${pkgbase}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Bbuild

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" \
    cmake --install build
}

sha256sums=('bee4dc055b0ce3f04ce68181c86f2b4d6234f5bcf1b276d545b830fe877fc22c')
