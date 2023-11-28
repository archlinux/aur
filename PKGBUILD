# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.1
pkgrel=0
pkgdesc="Clash Meta GUI based on tauri."
arch=('x86_64')
url="https://github.com/wonfen/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash-meta')
conflicts=("$_pkgname" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git")
source=("${_pkgname}-${pkgver}-${arch}.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('8d1afe99bc33535e178c1ce8077ae5c76ff024c74455dd500056ce87a25c941404f6d8037e9f65ee1462608e188db5bf947ee9994e00d5d962a107d3e9b0a940')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash-meta

    chown -R root:root ${pkgdir}
}
