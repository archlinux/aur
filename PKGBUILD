# Maintainer: Didier BONNEFOI <aur at prestaconcept dot net>
pkgname=ringover-bin
pkgver=1.3.1
pkgrel=2
pkgdesc="Ringover desktop application"
arch=('x86_64')
url="https://github.com/ringover/ringover-desktop"
license=("custom")
install=ringover.install

source=("https://github.com/ringover/ringover-desktop/releases/download/v${pkgver}/Ringover.deb")
sha512sums=("3cc752b2d06c8ccb593f2a137c58e3f5739c29efae5615ca746b0e1854982e0942496dfed607a80fd0029591e7a6632e91f0cf21db1112292164e3a62e370964")

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSE.electron.txt"   "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}"
  # fix application icon path
  mv "${pkgdir}/usr/share/icons/hicolor/"{0x0,256x256}
}
