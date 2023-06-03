# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: Maikel Llamaret Heredia <llamaret@webmisolutions.com>

pkgname=mystiq
_pkgname=MystiQ
pkgver=23.05.15
_pkgver=${pkgver}-2109
pkgrel=1
pkgdesc="FFmpeg GUI front-end based on Qt5."
arch=('x86_64')
url="https://github.com/biglinux/MystiQ"
license=('GPL3')
depends=('qt5-declarative' 'qt5-multimedia' 'ffmpeg' 'libnotify' 'sox')
makedepends=('qt5-tools')
source=("https://github.com/biglinux/MystiQ/archive/refs/tags/mystiq-${_pkgver}.tar.gz")
sha256sums=('3cdae6e93b35b7e8ee79dbb803aaba7c2b985395cd86548068cbfe57493fd8f6')

build() {
  cd ${_pkgname}-mystiq-${_pkgver}
  qmake mystiq.pro
  make 
  strip mystiq
}

package() {
   cd ${_pkgname}-mystiq-${_pkgver}

   make INSTALL_ROOT=${pkgdir} install
   install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
