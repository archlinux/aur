# Maintainer: Tobias Müller <mintuser17 at gmail dot com>

pkgname=teaspeak-client
pkgver=1.5.1
pkgrel=2
pkgdesc="A free to use client software for voice and video communication"
arch=('x86_64')
url='https://teaspeak.de/gb'
license=("custom:${pkgname}")
depends=('libxss'
         'nss'
         'gtk3')
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://clientapi.teaspeak.de/files/release/1.5.1-2/TeaClient-linux_x64.deb"
        'LICENSE')
sha256sums=('580dddb1a7a65540da696d886220b4f9818018e3b461bc465f79de1c39281710'
            'SKIP')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}/usr/lib/teaclient" -type f -exec chmod o-w {} +
  find "${pkgdir}/usr/lib/teaclient" -type d -exec chmod o-w {} +
}
