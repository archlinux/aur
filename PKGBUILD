# Maintainer: Jah Way <jahway603 at protonmail dot com>
 
_pkgname=ungoogled-chromium
pkgname=ungoogled-chromium-appimage
pkgver=87.0.4280.141
pkgrel=1
pkgdesc="A lightweight approach to removing Google web service dependency (binary AppImage)"
url='https://ungoogled-software.github.io/ungoogled-chromium-binaries/'
arch=('x86_64')
license=('BSD')
conflicts=('chromium')
options=(!strip) # needed for AppImage
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/LordTwix/${_pkgname}-binaries/releases/download/$pkgver-1.1/${_pkgname}_$pkgver-1.1_linux.AppImage")
noextract=("${_pkgname}-${pkgver}.AppImage")
sha256sums=('c885438761076d8e17899de651e142dc7296423661aa7a9a5cd539b7e2a01a84')

_filename=${_pkgname}-${pkgver}.AppImage

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"
  chmod +x "${pkgdir}/opt/appimages/${_filename}"

  # Symlink in /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/appimages/${_filename}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "/opt/appimages/${_filename}" "${pkgdir}/usr/bin/chromium"
}

