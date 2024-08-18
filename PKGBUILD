# Maintainer: buding <1259085392z@gmail.com>

pkgname=clash-verge-rev-bin-concise
_pkgname=clash-verge-rev
pkgver=1.7.6
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

sha512sums_x86_64=('ecf8a00ccad76b67a5a7a8cfe5230e5d19587814aaa77dcf0a6f85e21f296c2cccf6169a17752a63c82a2a63b67bd4f047b67f8292e70af9134437789f308bc2')
sha512sums_aarch64=('8683cacd7c67fec9c36bdd91f21d6e1fb1df5452efbe5caa3ad3c2e63a1526586169aaadac71ae55e6d9c44ee511f9115db824bf736af60fe39470b5f5c9afd4')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/verge-mihomo
    rm ${pkgdir}/usr/bin/verge-mihomo-alpha
    chown -R root:root ${pkgdir}
}
