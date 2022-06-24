# Maintainer: robertfoster

pkgname=whatsie
pkgver=4.4
pkgrel=1
pkgdesc="Fast Light weight WhatsApp Client based on Qt's WebEngine, With lots of settings and packed goodies"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/keshavbhatt/whatsie"
license=('MIT')
depends=('qt5-base' 'qt5-declarative' 'qt5-location' 'qt5-webchannel' 'qt5-webengine')
makedepends=('qt5-base')
source=("${url}/archive/${pkgver}.tar.gz")

build() {
  cd "${pkgname}-${pkgver}"
  qmake src
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}

sha256sums=('e1a09257b64015f69f897b4cb1247df13060d76334b95e3b535185d4bddee1ab')
