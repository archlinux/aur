# Maintainer: Tobias Müller <mintuser17 at gmail dot com> (Package Maintainer)
# Contributor: Markus Hadenfeldt <support at teaspeak dot de> (Program Maintainer)

pkgname=teaspeak-client
pkgver=1.5.3
pkgrel=2
pkgdesc="A free to use client software for voice and video communication"
arch=('x86_64')
url='https://teaspeak.de/gb'
license=("custom:${pkgname}")
depends=('libxss'
         'nss'
         'gtk3')
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://clientapi.teaspeak.de/files/release/1.5.3-2/TeaClient-linux_x64.deb"
        'LICENSE')
sha256sums=('3a7dc46ac8f22d8ee63d5d9a8c49a87ab4187cb0a1cfa894602bdf1956f81ac5'
            'SKIP')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}/usr/lib/teaclient" -type f -exec chmod o-w {} +
  find "${pkgdir}/usr/lib/teaclient" -type d -exec chmod o-w {} +
}
