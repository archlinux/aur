# Maintainer: Didier BONNEFOI <aur at prestaconcept dot net>
pkgname=ringover-bin
pkgver=2.0.19
pkgrel=1
pkgdesc="Ringover desktop application"
arch=('x86_64')
url="https://github.com/ringover/ringover-desktop-v2"
license=("custom")
install=ringover.install

source=("https://github.com/ringover/ringover-desktop-v2/releases/download/${pkgver}/Ringover.deb")
sha512sums=("b22a0ccda1f29ffc58f6400c5840fa4b5f9644a7eae3cdc080b05acdcd37fffbe916aca8a9c4b35262795f6d54d281951df2b393d80f7ef09c0869583b5d3d0e")

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSE.electron.txt"   "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}"
  # fix application icon path
  mv "${pkgdir}/usr/share/icons/hicolor/"{0x0,256x256}
}
