# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ultraedit
pkgver=18.00.0.66
pkgrel=1
pkgdesc="Proprietary text editor for Linux, ideal for C/C++, HTML, Javascript, XML, PHP, Python, and Java programmers... beginners, power users, and everyone in between (Trial)"
arch=('i686' 'x86_64')
url="https://www.ultraedit.com/products/uex"
license=('custom')
options=('!strip')
DLAGENTS=('https::/usr/bin/curl -fLC - --user-agent Lynx --retry 3 --retry-delay 3 -o %o %u')
source_i686=("${pkgname}-${pkgver}.tar.gz::https://downloads.ultraedit.com/main/ue/linux/tar/uex-${pkgver}_i386.tar.gz")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://downloads.ultraedit.com/main/ue/linux/tar/uex-${pkgver}_amd64.tar.gz")
sha256sums_i686=('ee076754aac5cfe113ddd076ed5381cc93ae77217a979f97728a8038a83e7b61')
sha256sums_x86_64=('32af45d2c0f6112c0af096b05fce2e3147221b10349a4725cd5198bb5012832b')

package() {
  mv -v "${srcdir}/uex" "${pkgdir}/usr"
  install -d "${pkgdir}/usr/share/pixmaps" \
		     "${pkgdir}/usr/share/applications" \
		     "${pkgdir}/usr/share/licenses/${pkgname}"
  mv -v "${pkgdir}/usr/share/uex/ue.png" "${pkgdir}/usr/share/pixmaps"
  mv -v "${pkgdir}/usr/share/uex/uex.desktop" "${pkgdir}/usr/share/applications"
  mv -v "${pkgdir}/usr/share/doc/uex/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}