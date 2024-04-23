# Maintainer: buding <1259085392z@gmail.com>

pkgname=clash-verge-rev-bin-concise
_pkgname=clash-verge-rev
pkgver=1.6.0
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri without kernel"
arch=('x86_64' 'aarch64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
optdepends=('clash-meta' 'clash-meta-bin' 'clash-meta-alpha-git')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge-rev-bin" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")

sha512sums_x86_64=('4e17e319a5d83bc35967c204f91dc270e3061009fa3a3a6175090c28e89d81959036abce9f29280e56b470e954feb872714abd8583dc23800f9e7659b68172c1')
sha512sums_aarch64=('161ed9865292f7fc9ab38509caae58c48010bf25d030e322f7d1e0f41a803469154fa9b6b3d1d5072f417d2a70f1a4551aee314a8bf0c92e393fa34e2a5e866f')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash-meta
    rm ${pkgdir}/usr/bin/clash-meta-alpha
    chown -R root:root ${pkgdir}
}
