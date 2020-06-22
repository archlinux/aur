# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=green-tunnel-bin
pkgver=1.7.4
pkgrel=1
pkgdesc='An anti-censorship utility designed to bypass the DPI system that is put in place by various ISPs to block access to certain websites'
arch=('x86_64')
url="https://github.com/SadeghHayeri/GreenTunnel"
license=('MIT')
depends=('nss'
         'gtk3'
         'libxss')
makedepends=('tar')
source=("${pkgname}-${pkgver}.zip::https://github.com/SadeghHayeri/GreenTunnel/releases/download/v${pkgver}/green-tunnel-debian.zip")
sha256sums=('9b7da96908ead5252f233713c16967ddcc3a6eff0282a43cf91e5e623c596b6c')

package() {
  ar x green-tunnel_${pkgver}_amd64.deb
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 "${pkgdir}/usr/share/doc/green-tunnel/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "${pkgdir}/usr/share/doc/"
}