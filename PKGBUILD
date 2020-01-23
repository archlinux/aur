# Maintainer: Maikel Llamaret Heredia <llamaret@webmisolutions.com>

pkgname=mystiq
_pkgname=MystiQ
pkgver=20.01.22
pkgrel=1
pkgdesc="FFmpeg GUI front-end based on Qt5."
arch=('x86_64')
url="https://mystiq.swlx.info/"
license=('GPL3')
depends=('qt5-declarative' 'qt5-multimedia' 'ffmpeg' 'libnotify' 'sox')
makedepends=('qt5-tools')
replaces=('qwinff')
source=("https://github.com/llamaret/MystiQ/archive/v${pkgver}.tar.gz")
sha256sums=('e56cb284d16682e0534a9c9dde1920928ac55e439e1921b1c8aea7afe9899b01')

build() {
  cd ${_pkgname}-${pkgver}
  qmake mystiq.pro
  make 
  strip mystiq
}

package() {
   cd ${_pkgname}-${pkgver}

   make INSTALL_ROOT=${pkgdir} install
   install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
