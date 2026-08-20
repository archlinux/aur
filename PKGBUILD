# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-intercom
pkgver=0.11.0
pkgrel=1
pkgdesc='Direct 1:1 messaging extension for pi coding agent sessions'
arch=('any')
url='https://github.com/nicobailon/pi-intercom'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-intercom/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('146c6513e2a69e67a4f39bbf4abfe99ab27188704298cc9800e9761ccb71aaca')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/intercom"
  cp -a "${srcdir}/pi-intercom-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/intercom/"
  rm -f "${pkgdir}/usr/share/pi/extensions/intercom/"*.test.ts
  rm -f "${pkgdir}/usr/share/pi/extensions/intercom/broker/"*.test.ts

  install -Dm644 "${srcdir}/pi-intercom-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
