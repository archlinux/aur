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

sha512sums=('a350831e71e6d80cf6ff2835bc472af8aceaf7304ff13212a9e1a04832cf1d55bde98fb532f693b89e0b0a53e3dbeb9591fd4b1e5b95d56aa0393a3ad1a45618')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash-meta

    chown -R root:root ${pkgdir}
}
