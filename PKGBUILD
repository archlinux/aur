# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=autopulse-bin
pkgver=2.0.0
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
sha256sums_x86_64=('5dd0c88450e247ce8a1bdfd9d7449f06ff79a8c0ca6f68078286231cd3f9d428')
sha256sums_aarch64=('175889cd31773a3e1010b867b434dab4016431d7dd6778704035e89feeec70a5')

package() {
  install -Dm755 "autopulse" "${pkgdir}/usr/bin/autopulse"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
