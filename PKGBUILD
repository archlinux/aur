# Maintainer: buding <1259085392z@gmail.com>

pkgname=clash-verge-rev-bin-concise
_pkgname=clash-verge-rev
pkgver=1.7.3
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

sha512sums_x86_64=('1ed0855d10a0fb54d11b90ee48b0cf612cc4e89ab809f62e051106ceb5ff1c4355780b1bdd16abd7409659bf937eb7d94048dd9efb59c36900bc1b097b9ee8ef')
sha512sums_aarch64=('2c957c1f6382fa1ba3e40eecd9b65e77279a0521d0e61287991fefdf0ec56097004c2db28e07ab43f123eda1a30bb988d723c8a05e9816d33c94dc4f513966fa')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/verge-mihomo
    rm ${pkgdir}/usr/bin/verge-mihomo-alpha
    chown -R root:root ${pkgdir}
}
