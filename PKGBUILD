pkgname=clash-nyanpasu-bin
_pkgname=clash-nyanpasu
pkgver=1.6.0
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL3')
options=('!strip' '!debug')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash-meta')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-appimage' 'clash-nyanpasu')
provides=('clash-nyanpasu')
optdepends=('clash-rs: custom protocol network proxy, coding with rust')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/LibNyanpasu/clash-nyanpasu/releases/download/v${pkgver}/clash-nyanpasu_${pkgver}_amd64.deb")
sha256sums=('07eb838cfaaff9ac31f295e78a16a7f6c284c95a764b607cd2dee7ef4362da24')

package() {
  tar xpf data.tar.gz -C ${pkgdir}
  rm ${pkgdir}/usr/bin/clash
  rm ${pkgdir}/usr/bin/mihomo
  rm ${pkgdir}/usr/bin/clash-rs
  rm ${pkgdir}/usr/bin/mihomo-alpha
  # thanks https://aur.archlinux.org/clash-meta-is-mihomo.git
  ln -s /usr/bin/clash-meta "${pkgdir}/usr/bin/mihomo"

}
