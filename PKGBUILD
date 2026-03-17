# Maintainer: UnDadFeated <undadfeated@users.noreply.github.com>
pkgname=massav1encoder
_pkgname=Mass_AV1_Encoder
pkgver=10.3.0
pkgrel=1
pkgdesc="World-class, high-density AV1 encoding dashboard for high-efficiency archival."
arch=('any')
url="https://github.com/UnDadFeated/Mass_AV1_Encoder"
license=('MIT')
depends=('pyside6' 'python-psutil' 'ffmpeg')
optdepends=('nvidia-utils: Hardware acceleration for NVIDIA GPUs')
source=("${pkgname}.desktop"
        "${pkgname}.sh"
        "${pkgname}.png"
        "git+${url}.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  # Create directories
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/pixmaps"

  # Install application files
  cp -r . "${pkgdir}/usr/share/${pkgname}/"

  # Install launcher
  install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install desktop file
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
