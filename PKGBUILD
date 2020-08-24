# Maintainer: Jah Way <jahway603 at protonmail dot com>
 
_pkgname=silentdragonlite
pkgname=silentdragonlite-appimage
pkgver=1.3.9
pkgrel=1
pkgdesc='HUSH Lite wallet that supports zaddrs (binary AppImage version)'
url='http://github.com/MyHush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
conflicts=('silentdragonlite')
options=(!strip) # needed for AppImage
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/MyHush/SilentDragonLite/releases/download/v$pkgver/Linux-binaries-SilentDragonLite-v$pkgver.AppImage")
noextract=("${_pkgname}-${pkgver}.AppImage")
sha256sums=('f713487b23b14a28653a0d9fc90b078bd3583cd5126156f2b624651f298f92e9')

_filename=${_pkgname}-${pkgver}.AppImage

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"
  chmod +x "${pkgdir}/opt/appimages/${_filename}"

  # Symlink in /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/appimages/${_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}

