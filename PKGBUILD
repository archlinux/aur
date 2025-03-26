# Maintainer: Didier BONNEFOI <aur at prestaconcept dot net>
pkgname=ringover-bin
pkgver=2.1.13
pkgrel=1
pkgdesc="Ringover desktop application"
arch=('x86_64')
url="https://github.com/ringover/ringover-desktop-v2"
license=("custom")
install=ringover.install

source=("https://github.com/ringover/ringover-desktop-v2/releases/download/${pkgver}/Ringover.deb")
sha512sums=("d538744d52857e5e157a656dd0d60262906ee2e1334fe4835d14505cf947a73ad4d51aba25d9e768b2b5cb5322402d97215a209e3f5affac8dff7a7cbc1479fb")

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSE.electron.txt"   "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}"
}
