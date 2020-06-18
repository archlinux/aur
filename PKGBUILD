# Maintainer: Jah Way <jahway603 at protonmail dot com>
 
_pkgname=silentdragonlite
pkgname=silentdragonlite-appimage
pkgver=1.3.5
pkgrel=1
pkgdesc='HUSH Lite wallet that supports zaddrs (binary AppImage version)'
url='http://github.com/MyHush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
conflicts=('silentdragonlite')
options=(!strip) # needed for AppImage
source=("${_pkgname}.AppImage::https://github.com/MyHush/SilentDragonLite/releases/download/v$pkgver/Linux-binaries-SilentDragonLite-v$pkgver.AppImage")
noextract=("${_pkgname}.AppImage")
sha256sums=('5fe57ee089f95457aa8424cbb9ee40191cbf2de93a18c36cdcbc992412ffc384')

_filename=${_pkgname}.AppImage

package() {
  cd "${srcdir}"
  install -Dm755 "${_filename}" "${pkgdir}/opt/appimages/${_filename}"
  chmod +x "${pkgdir}/opt/appimages/${_filename}"

  # Symlink in /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/appimages/${_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}

