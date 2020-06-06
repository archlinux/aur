# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ohhaibrowser-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="A productivity focused web browser"
arch=('x86_64')
url='https://ohhaibrowser.com'
depends=('gtk3'
         'nss'
         'libxss')
license=('GPL3')
provides=('ohhaibrowser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OhHaiBrowser/Browser/releases/download/v3.4/ohhaibrowser-${pkgver}.x86_64.rpm")
sha256sums=('13d499808c004d1aed600419ed4dcf8749cdceb1b50d384d9c84b994048776e2')

package() {
  rm -rf usr/lib
  cd usr/share/icons/hicolor/
  mv 0x0 512x512
  cd "${srcdir}"
  cp -aR usr/ "${pkgdir}/"
  cp -aR opt/ "${pkgdir}/"
}