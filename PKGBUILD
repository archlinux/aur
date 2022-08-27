# Maintainer: robertfoster

pkgname=whatsie
pkgver=4.8.2
pkgrel=1
pkgdesc="Fast Light weight WhatsApp Client based on Qt's WebEngine, With lots of settings and packed goodies"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/keshavbhatt/whatsie"
license=('MIT')
depends=('qt5-base' 'qt5-declarative' 'qt5-location' 'qt5-webchannel' 'qt5-webengine')
makedepends=('qt5-base')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${pkgname}-${pkgver}"
  qmake src
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}

sha256sums=('2889510553a9e89c536099965fc1d75fc83231f2e605fb8e7b861f0c122a3743')
