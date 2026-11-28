# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=autopulse-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Update Plex, Jellyfin and other media servers from Sonarr and Radarr notifications"
arch=('x86_64' 'aarch64')
url="https://github.com/dan-online/autopulse"
license=('MIT')
depends=('glibc' 'libgcc' 'postgresql-libs' 'sqlite')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dan-online/autopulse/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/autopulse-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/autopulse-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('f81a86b7bab42f2596d02465fc98977cf32b396535ff6d0cd180bdfafc230581')
sha256sums_x86_64=('f33f8e9b8ab01fb878282763c46b97d39cb5e94bdfaf59129b19977e14b7469c')
sha256sums_aarch64=('a85557648adc525ec478db1073dc01397742db2888d56b9e3e207f542918806a')

package() {
  install -Dm755 "autopulse" "${pkgdir}/usr/bin/autopulse"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
