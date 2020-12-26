# Maintainer: Jah Way <jahway603 at protonmail dot com>
 
_pkgname=ungoogled-chromium
pkgname=ungoogled-chromium-appimage
pkgver=87.0.4280.88
pkgrel=1
pkgdesc="A lightweight approach to removing Google web service dependency (binary AppImage)"
url='https://github.com/mcstrugs/ungoogled-chromium-binaries'
arch=('x86_64')
license=('BSD')
conflicts=('chromium')
options=(!strip) # needed for AppImage
source=("${_pkgname}-${pkgver}.AppImage::$url/releases/download/$pkgver-1.1/${_pkgname}_$pkgver-1.1_linux.AppImage")
noextract=("${_pkgname}-${pkgver}.AppImage")
sha256sums=('63695cd01819a8169f3da0c4c50d64aa25d875dbe92f48ae2c357d27ad7449e5')

_filename=${_pkgname}-${pkgver}.AppImage

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"
  chmod +x "${pkgdir}/opt/appimages/${_filename}"

  # Symlink in /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/appimages/${_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}

