# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=lima-gui
pkgver=0.3.0
pkgrel=2
pkgdesc="Making a GUI for lima VM."
arch=('x86_64')
url="https://github.com/afbjorklund/lima-gui"
license=('BSD')
depends=('lima' 'qt5-base')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/afbjorklund/lima-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('248f5cdee05e6aa71eb660f1a40a04a2e6e76cb84d053d07b2a611b4765ca2eb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
