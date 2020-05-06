# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=deepnest-bin
pkgver=1.0.5
pkgrel=1
pkgdesc='An open source nesting application, great for laser cutters, plasma cutters, and other CNC machines'
arch=('x86_64')
url='https://deepnest.io'
license=('None')
install=deepnest.install
depends=('zlib' 'pango-legacy')
provides=('deepnest')
options=('!strip')
source=("${pkgname}-${pkgver}.zip::https://deepnest.io/Deepnest-${pkgver}-linux.zip")
sha256sums=('54c049da97acc39741a4c960833258b0b2f9772dbdffdc1a27370983a8657a51')

package() {
  install -d "${pkgdir}/opt/${pkgname%-bin}"
  install -Dm755 "${srcdir}/Deepnest-${pkgver}-linux/Deepnest-${pkgver}-x86_64.AppImage" -t "${pkgdir}/opt/${pkgname%-bin}/"
  echo "#!/usr/bin/env bash
  LD_LIBRARY_PATH=/opt/pango-legacy/usr/lib /opt/deepnest/Deepnest-${pkgver}-x86_64.AppImage" > deepnest
  install -Dm755 deepnest -t "${pkgdir}/usr/bin"
}
# vim:set ts=2 sw=2 et: