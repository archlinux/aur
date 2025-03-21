# Maintainer: Didier BONNEFOI <aur at prestaconcept dot net>
pkgname=ringover-bin
pkgver=2.1.12
pkgrel=1
pkgdesc="Ringover desktop application"
arch=('x86_64')
url="https://github.com/ringover/ringover-desktop-v2"
license=("custom")
install=ringover.install

source=("https://github.com/ringover/ringover-desktop-v2/releases/download/${pkgver}/Ringover.deb")
sha512sums=("83f70c646f741d3bf36c821cc0f4ad5e2a26f04da3240e53a528f8c5939b7f042ec89c4783ac95b7136457dc915795ce74cf964cdcc9ebd5aefcb320fa2dba9a")

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSE.electron.txt"   "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}"
}
