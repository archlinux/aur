# Maintainer: thadah <thadahdenyse@protonmail.com>
pkgname=sable-next-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Sable rewrite in Rust and Svelte"
url=" https://next.sable.moe"
license=('AGPL-3.0-or-later')
arch=('x86_64')
depends=(
  'alsa-lib'
  'gtk3'
  'libcups'
  'libpipewire'
  'libxkbcommon'
  'mesa'
  'nspr'
  'nss'
)
options=(!debug)
provides=('sable-next')
conflicts=('sable-next')
source=("${pkgname}-${pkgver}.deb::https://git.sable.moe/SableClient/sable-next/releases/download/v${pkgver}/sable-${pkgver}-linux-x86_64.deb")
sha256sums=('e7e52b457844fdb44bef058aa60e6458589f4389dc0a0d8315fdc14c8f42189b')

package() {
  bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  # Install license
  install -Dm644 "${pkgdir}/opt/sable-next/CEF-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/CEF-LICENSE.txt"
}
