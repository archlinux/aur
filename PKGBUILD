# Maintainer: celeste <renzhewudi2013@outlook.com>

pkgname=alma-appimage
_pkgname=alma
pkgver=0.0.227
pkgrel=1
pkgdesc="A beautiful desktop application that unifies your AI experience."
arch=('x86_64')
url="https://github.com/yetone/alma-releases"
license=('custom')
options=('!strip' '!debug')
depends=('fuse2')
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/alma-${pkgver}-linux-${arch}.AppImage"
  "${_pkgname}.desktop"
  "${_pkgname}.png"
  "${_pkgname}.sh")
noextract=("${_pkgname}-${pkgver}.AppImage")
conflicts=("${_pkgname}")

package() {
  cd "$srcdir"

  # Create directories
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

  # Install AppImage
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  # Install icon
  install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  # Install desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  # Install alma
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
sha256sums=('add0fd4a75d62b526d7c1fdefb35fd0694c175db81354183af4c09cd7935b174'
            'cc72943eba33facd3e3a00f30ecac1753407255cef5e5ed508e3e9c6a8014ddc'
            '153b2379e92cf9e6f1158b5baf7d22102b100028e7e04c4ca79dd009a3e1dc00'
            'afb4bb27b8071b6de919ebcde97a1b4dd27fa1ae5451afe14e533e51e00bb402')
