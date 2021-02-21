pkgname=geforcenow-electron
pkgver=1.0.9
pkgrel=1
pkgdesc="Linux desktop client for GeForce NOW, using Electron"
arch=("armv7l" "i686" "x86_64")
url="https://github.com/hmlendea/${pkgname}"
license=('CCPL')
source=("https://github.com/hmlendea/${pkgname}/releases/download/v${pkgver}/geforcenow_${pkgver}_linux.zip"
        "https://raw.githubusercontent.com/hmlendea/geforcenow-electron/master/icon.png")
sha256sums=('3d4f7990bdddbf9d32a942fed06378f2a6e1324f5d681b80898e90e86f5fe397'
            '582ad4bb073926e51d8acaa0ab81aa70a1dbe4736eda0cf130b6ae689982b7a0')

build() {
  cd ${srcdir}
  rm "${srcdir}/geforcenow_${pkgver}_linux.zip"
}

package() {
  install -d "${srcdir}" "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr/share/applications"
	install -d "${pkgdir}/usr/share/pixmaps"

  cp -r ${srcdir}/* "${pkgdir}/opt/${pkgname}/"
	install -m644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/nvidia.png"
	install -m755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
}
