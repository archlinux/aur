# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=wcofun
pkgver=r34.0118b37
pkgrel=1
pkgdesc="Stream and download animes directly from your terminal."
url="https://github.com/matheusfillipe/wcofun.cli"
license=('MIT')
arch=('any')
md5sums=('SKIP')
makedepends=(git)
depends=(curl coreutils htmlq jq fzf rofi mpv bash curl-impersonate-chrome)
optdepends=('rofi: GUI menu'
            'dmenu: GUI menu')
provides=(wcofun)
source=("git+$url")

pkgver() {
  cd ${pkgname}.cli
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
  cd ${pkgname}.cli
  install -Dm755 wcofun "${pkgdir}/usr/bin/${pkgname}"
}
