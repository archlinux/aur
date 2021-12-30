# Maintainer: Didier BONNEFOI <aur at prestaconcept dot net>
pkgname=ringover-bin
pkgver=2.0.14
pkgrel=1
pkgdesc="Ringover desktop application"
arch=('x86_64')
url="https://github.com/ringover/ringover-desktop-v2"
license=("custom")
install=ringover.install

source=("https://github.com/ringover/ringover-desktop-v2/releases/download/${pkgver}/Ringover.deb")
sha512sums=("5c2698bc8393b49399c3cff1aa82e77ed5ee4418adc410524ed419ce101670667cdcfb660dd8aba6fc009470a14649a66a609c95580df5910c58a50f3c77f98b")

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSE.electron.txt"   "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/opt/Ringover/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}"
  # fix application icon path
  mv "${pkgdir}/usr/share/icons/hicolor/"{0x0,256x256}
}
