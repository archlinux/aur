# Maintainer: buding <1259085392z@gmail.com>

pkgname=clash-verge-rev-bin-concise
_pkgname=clash-verge-rev
pkgver=1.6.1
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

sha512sums_x86_64=('e30fc0b8c1e6e40ed8efd759063f8510c84c72be7476b98a5b44fc4f1699c052fe6ca14ef01aaad3416a843aad9a4a641b821329b8663e1a709bad63c1aa7680')
sha512sums_aarch64=('f486a8883161d0c9e0c6c15a8f2cd228ae096be5877683fd3ba3a06287f2f5c0f0064cc13b142b2098589b6af14cbe6ab2b4c5d4a8533043d2e7fc9a61b2d454')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash-meta
    rm ${pkgdir}/usr/bin/clash-meta-alpha
    chown -R root:root ${pkgdir}
}
