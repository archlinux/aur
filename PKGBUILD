# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=teaspeak-client
pkgver=1.4.8
pkgrel=1
pkgdesc="A free to use client software for VoIP communication"
arch=('x86_64')
url='https://teaspeak.de/gb'
license=('GPL3')
depends=('libxss'
				 'nss'
				 'gtk3')
source=("${pkgname}-${pkgver}.deb::http://clientapi.teaspeak.de/files/release/${pkgver}/TeaClient-linux_x64.deb")
sha256sums=('4cdfc0870f927450bb0f1b76bddec5eace5b51bfc7879d171e6638bea240a465')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  find "${pkgdir}/usr/lib/teaclient" -type f -exec chmod o-w {} +
  find "${pkgdir}/usr/lib/teaclient" -type d -exec chmod o-w {} +
}