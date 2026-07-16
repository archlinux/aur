# Maintainer: Shizzzzoo <9429.sahl@gmail.com>

pkgname=derkruns-bin
pkgver=1.0.0.beta.2
pkgrel=1
pkgdesc="Cartoony retro run-and-gun adventure with vehicles and a multi-phase boss"
arch=('x86_64')
url="https://github.com/Shizzzzoo/DerkRuns"
license=('Apache-2.0')
depends=('glibc' 'zlib')
provides=('derkruns')
conflicts=('derkruns')
options=('!strip' '!debug')
_upstream_version=1.0.0-beta.2
source=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/v${_upstream_version}/DerkRuns-linux-x64.zip"
  "derkruns.png::https://raw.githubusercontent.com/Shizzzzoo/DerkRuns/v${_upstream_version}/assets/retro_assault_key_art.png"
  'derkruns.desktop'
)
sha256sums=(
  '71fed45b390c8f4eef22c8998131dbf92a541297329ae41aedeabf419d902262'
  '249db102c9c5dbdc209c70f8ed62273f8c4fbdefe2537a7123cd48426e5ac0b7'
  '0335946f3d0d8520cd8f636d03204cde8e4384e473b0209330bf58df89715678'
)

package() {
  install -Dm755 "${srcdir}/DerkRuns" "${pkgdir}/usr/bin/derkruns"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/derkruns/README.md"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/derkruns/LICENSE"
  install -Dm644 "${srcdir}/derkruns.png" "${pkgdir}/usr/share/pixmaps/derkruns.png"
  install -Dm644 "${srcdir}/derkruns.desktop" "${pkgdir}/usr/share/applications/derkruns.desktop"
}
