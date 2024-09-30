# Maintainer: Barra Ihsan <barra at duck dot com>
pkgname="jerry-cli-git"
_pkgname="jerry"
pkgver=r150.e8d1598
pkgrel=1
pkgdesc="watch anime with automatic anilist syncing and other cool stuff"
arch=('any')
url="https://github.com/justchokingaround/jerry"
license=('unknown')
depends=('grep' 'sed' 'curl' 'fzf' 'mpv')
makedepends=('git')
optdepends=('rofi: external launcher' 'ueberzugpp: image preview with fzf' 'chafa: display image' 'jq: for displaying anime/manga info')
conflicts=("${pkgname%-git}")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 "./jerry.sh" "${pkgdir}/usr/bin/jerry"
}
