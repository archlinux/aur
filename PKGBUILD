# Maintainer: Micraow <micraow@users.noreply.github.com>
pkgname=wpsdav-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Mount WPS/Kdocs cloud storage as a WebDAV endpoint"
arch=('x86_64')
url="https://github.com/Micraow/WPS-DAV"
license=('MIT')
provides=('wpsdav')
conflicts=('wpsdav' 'wpsdav-git')
options=('!strip' '!debug')
source=("wpsdav-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/wpsdav_${pkgver}_linux_amd64.tar.gz")
# Replace SKIP with the checksum published in the release's
# checksums-sha256.txt before submitting/updating the AUR package.
sha256sums=('91943e1ba39ef164f87b37b3d6151d8ca2ae68392432012dc407cb878cbb6722')

package() {
  install -Dm755 "${srcdir}/wpsdav" "${pkgdir}/usr/bin/wpsdav"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/doc/${pkgname}/config.example.json"
}
