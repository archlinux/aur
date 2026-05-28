# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-intercom
pkgver=0.6.0
pkgrel=2
pkgdesc='Direct 1:1 messaging extension for pi coding agent sessions'
arch=('any')
url='https://github.com/nicobailon/pi-intercom'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-intercom/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('36dc20342a225fbbcd2485f94e4f59bae4be866dd4ddfcf6ca752293f36e771f')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/intercom"
  cp -a "${srcdir}/pi-intercom-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/intercom/"
  rm -f "${pkgdir}/usr/share/pi/extensions/intercom/"*.test.ts
  rm -f "${pkgdir}/usr/share/pi/extensions/intercom/broker/"*.test.ts

  install -Dm644 "${srcdir}/pi-intercom-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
