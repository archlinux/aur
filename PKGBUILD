# Maintainer: Barfin

pkgname=green-tunnel-bin
pkgver=1.8.3
pkgrel=3
pkgdesc='An anti-censorship utility designed to bypass the DPI system that is put in place by various ISPs to block access to certain websites'
arch=('x86_64')
url="https://github.com/SadeghHayeri/GreenTunnel"
license=('MIT')
provides=('green-tunnel')
depends=('nss'
         'gtk3'
         'libxss')
makedepends=('tar')
source=("${pkgname}-${pkgver}.zip::https://github.com/SadeghHayeri/GreenTunnel/releases/download/v${pkgver}/green-tunnel-debian.zip")
sha256sums=('d00a6f4e43993a4b8c96546a3a8afbe04a5d11d0d65ab9dcc5137b0b6857f3dc')

package() {
  ar x green-tunnel_1.7.5_amd64.deb 
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 "${pkgdir}/usr/share/doc/green-tunnel/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "${pkgdir}/usr/share/doc/"
}
