pkgname=clash-nyanpasu-bin
_pkgname=clash-nyanpasu
pkgver=1.4.4
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64')
url="https://github.com/keiko233/clash-nyanpasu"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash-meta')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-appimage')
provides=('clash-nyanpasu')
optdepends=('clash-rs: custom protocol network proxy, coding with rust')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/keiko233/clash-nyanpasu/releases/download/v${pkgver}/clash-nyanpasu_${pkgver}_amd64.deb")
sha256sums=('61c50be02fc0e8a6713af51937b41f721fb51d6287515b8d142aec04fb56461d')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/mihomo
    rm ${pkgdir}/usr/bin/clash-rs
    rm ${pkgdir}/usr/bin/mihomo-alpha
    # thanks https://aur.archlinux.org/clash-meta-is-mihomo.git
    ln -s /usr/bin/clash-meta "${pkgdir}/usr/bin/mihomo"

}
