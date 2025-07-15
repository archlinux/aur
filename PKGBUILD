# Maintainer: Didier BONNEFOI <aur at prestaconcept dot net>
pkgname=ringover-bin
pkgver=2.1.15
pkgrel=1
pkgdesc="Ringover desktop application"
arch=('x86_64')
url="https://github.com/ringover/ringover-desktop-v2"
license=("custom")
install=ringover.install

source=("https://github.com/ringover/ringover-desktop-v2/releases/download/${pkgver}/Ringover.deb")
sha512sums=("0fe83058d877afdef9e7e97b84daa7123d88352447f96d7f619e7ecfdf4032e84b5ad3ca9ee9cd77eabe57ebb20cd1244975a8e52621fe8755f8232aa9d64a5e")

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSE.electron.txt"   "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}"
}
