# Maintainer: Maikel Llamaret Heredia <llamaret@webmisolutions.com>

pkgname=mystiq
_pkgname=MystiQ
pkgver=20.02.18
pkgrel=1
pkgdesc="FFmpeg GUI front-end based on Qt5."
arch=('x86_64')
url="https://mystiq.swlx.info/"
license=('GPL3')
depends=('qt5-declarative' 'qt5-multimedia' 'ffmpeg' 'libnotify' 'sox')
makedepends=('qt5-tools')
replaces=('qwinff')
source=("https://github.com/llamaret/MystiQ/archive/v${pkgver}.tar.gz")
sha256sums=('6ccfe2ff37b6cb29a01afcca5e8110a5808dc041924ec4f36c21a5d859b65cfe')

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
