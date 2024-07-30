# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: Maikel Llamaret Heredia <llamaret@webmisolutions.com>

pkgname=mystiq
_pkgname=MystiQ
pkgver=24.06.15
_pkgver=${pkgver}-0203
pkgrel=1
pkgdesc="FFmpeg GUI front-end based on Qt5."
arch=('x86_64')
url="https://github.com/biglinux/MystiQ"
license=('GPL-3.0-or-later')
depends=('qt5-declarative' 'qt5-multimedia' 'ffmpeg' 'libnotify' 'sox' 'qt5-base' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("https://github.com/biglinux/MystiQ/archive/refs/tags/mystiq-${_pkgver}-x86_64.tar.gz" "mystiq-kservice.desktop")
sha256sums=('8d0429bd91cead3bf6c45692739a78c2397dc8bac53236f796604877b39a94fa' 'd6b87c7420f4d6f9ddf6fd1caff66b9d178983f5578078550c0fda2a24f1dd6d')

build() {
  cd ${_pkgname}-mystiq-${_pkgver}-x86_64
  qmake mystiq.pro
  make
}

package() {
   cd ${_pkgname}-mystiq-${_pkgver}-x86_64

   make INSTALL_ROOT=${pkgdir} install
   install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm755 "../mystiq-kservice.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/mystiq.desktop"
   }
