# Maintainer: buding <1259085392z@gmail.com>

pkgname=clash-verge-rev-bin-concise
_pkgname=clash-verge-rev
pkgver=1.5.11
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

sha512sums_x86_64=('4e707801ce650e52232733b14e6ccfa638af2a8f9152cff59568d424601f7d2247d1621e6a4ef9613a69a6c258bee866c0902cf26ca67e106cf20a6a3ec51cf5')
sha512sums_aarch64=('4cf2f783cd03ac33477504b3c3530f7b8331f2eb8520a24639d964980c9d360266a002b7482edb92a4163a87cdf1a76d5522f5e431b2668f3d0be6ae5221e83f')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash-meta
    rm ${pkgdir}/usr/bin/clash-meta-alpha
    chown -R root:root ${pkgdir}
}
