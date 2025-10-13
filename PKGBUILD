pkgname=clash-nyanpasu-nightly-bin
_pkgname=clash-nyanpasu
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL3')
options=(!strip)
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-appimage' 'clash-nyanpasu' 'clash-nyanpasu-bin')
makedepends=('curl' 'jq')

_pkgver=$(curl -Ls "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/pre-release/latest.json" | jq -r '.version')
pkgver=$(echo "${_pkgver}" | sed 's/-/_/')

source=("${_pkgname}-${_pkgver}-${arch}.deb::https://github.com/LibNyanpasu/clash-nyanpasu/releases/download/pre-release/Clash.Nyanpasu_${_pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  tar xpf data.tar.gz -C ${pkgdir}
}
