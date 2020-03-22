# Maintainer: Maikel Llamaret Heredia <llamaret@webmisolutions.com>

pkgname=mystiq
_pkgname=MystiQ
pkgver=20.03.23
pkgrel=1
pkgdesc="FFmpeg GUI front-end based on Qt5."
arch=('x86_64')
url="https://mystiqapp.com/"
license=('GPL3')
depends=('qt5-declarative' 'qt5-multimedia' 'ffmpeg' 'libnotify' 'sox')
makedepends=('qt5-tools')
replaces=('qwinff')
source=("https://github.com/swl-x/MystiQ/archive/v${pkgver}.tar.gz")
sha256sums=('cfb84faebf68876733624e4500d4b6c654bc01cb75fd6eddd9efa8337816d22e')

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
