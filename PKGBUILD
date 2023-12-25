pkgname=clash-nyanpasu-bin
_pkgname=clash-nyanpasu
pkgver=1.4.2
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
sha256sums=('b49f457e7f6d6c027d982357120dbe273d02d2e5909b2165de68715455b7455f')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/mihomo
    rm ${pkgdir}/usr/bin/clash-rs
    rm ${pkgdir}/usr/bin/mihomo-alpha
    # thanks https://aur.archlinux.org/clash-meta-is-mihomo.git
    ln -s /usr/bin/clash-meta "${pkgdir}/usr/bin/mihomo"

}
