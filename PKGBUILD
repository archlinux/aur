# Maintainer: wowario <wowario[at]protonmail[dot]com>
# Contributor: wowario <wowario[at]protonmail[dot]com>

pkgname=wowlet-git
_pkgname=wowlet
pkgver=3.0.0.ae33c2f1b0
pkgrel=1
pkgdesc='a free Wownero desktop wallet'
license=('BSD')
arch=('x86_64')
url="https://git.wownero.com/wowlet/wowlet"
depends=('boost-libs' 'libunwind' 'openssl' 'readline' 'zeromq' 'pcsclite' 'hidapi' 'protobuf' 'libusb' 'libudev.so' 'miniupnpc' 'libgcrypt' 'qrencode' 'libsodium' 'libpgm' 'expat' 'qt5-base' 'qt5-websockets' 'qt5-svg' 'tor' 'qt5-multimedia')
makedepends=('git' 'cmake' 'boost')

source=("${pkgname}"::"git+https://git.wownero.com/wowlet/wowlet")

sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake ..
  make
}

package_wowlet-git() {
  install -Dm755 "${srcdir}/${pkgname}/build/bin/wowlet" "${pkgdir}/usr/bin/wowlet"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm644 "${srcdir}/${pkgname}/docs/SECURITY.md" "${pkgdir}/usr/share/doc/${_pkgname}/SECURITY"
  install -Dm644 "${srcdir}/${pkgname}/docs/HACKING.md" "${pkgdir}/usr/share/doc/${_pkgname}/HACKING"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/org.wowlet.wowlet.desktop" "${pkgdir}/usr/share/applications/org.wowlet.wowlet.desktop"
  install -d "${pkgdir}/usr/share/man/man1/"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/wowlet.1.gz" "${pkgdir}/usr/share/man/man1/wowlet.1.gz"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/appicons/wowlet.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wowlet.svg"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/appicons/48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/wowlet.png"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/appicons/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/wowlet.png"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/appicons/96x96.png" "${pkgdir}/usr/share/icons/hicolor/96x96/apps/wowlet.png"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/appicons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/wowlet.png"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/appicons/192x192.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/wowlet.png"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/appicons/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wowlet.png"
}
