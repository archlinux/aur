# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=bemoji-git
pkgver=r6.8a31a36
pkgrel=1
pkgdesc="Emoji picker that remembers your favorites."
arch=('any')
url="https://github.com/marty-oehme/bemoji"
license=('MIT')
depends=('coreutils' 'curl')
optdepends=(
  'bemenu: Emoji picker menu'
  'rofi: Emoji picker menu'
  'dmenu: Emoji picker menu'
  'wl-clipboard: For copying to clipboard'
  'xclip: For copying to clipboard'
  'wtype: For typing selected emoji'
  'xdotool: For typing selected emoji'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm755 -t "${pkgdir}/usr/bin" bemoji
}
