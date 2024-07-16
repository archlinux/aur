# Maintainer: buding <1259085392z@gmail.com>

pkgname=clash-verge-rev-bin-concise
_pkgname=clash-verge-rev
pkgver=1.7.5
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

sha512sums_x86_64=('2e1217784faddbb6dec0949d79723f00770deb05e6d099d05846ee6dcfd550271f941189675a0363363682eaeb10ed5eb3f7d365f6a3855d7866d7cf55c85dee')
sha512sums_aarch64=('5fc638a3d840f5b39715c930929e4b7c28cd6ba157d7f2abacd08c7c206b457df1a93d634b3dcc7ad61618a004d3305bf91dff078788f761bb43ff7bdeed3e2f')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/verge-mihomo
    rm ${pkgdir}/usr/bin/verge-mihomo-alpha
    chown -R root:root ${pkgdir}
}
