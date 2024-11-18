# Maintainer: 0fflineuser <0fflineuser@cock.li>
pkgname="magic-tape.sh-git"
pkgver=r152.ea64473
pkgrel=1
pkgdesc="Magic-tape is an image supporting fuzzy finder command line interface YouTube client."
arch=('x86_64')
url="https://gitlab.com/christosangel/magic-tape.git"
license=('GPL')
depends=('yt-dlp' 'bash>=4.2' 'curl' 'fzf' 'mpv' 'jq' 'xclip' 'dmenu' 'rofi')
install=magic-tape.install
makedepends=('git')
optdepends=('kitty: Image Support' 'chafa: Image Support' 'ueberzug: Image Support' 'ueberzugpp: Image Support')
source=("${pkgname}::git+https://gitlab.com/christosangel/magic-tape.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/share/magic-tape/"
  cp -r png/ "$pkgdir/usr/share/magic-tape/"
  install -Dm755 "magic-tape.conf" "$pkgdir/etc/magic-tape.conf"
  install -Dm755 "magic-tape.sh" "$pkgdir/usr/bin/magic-tape.sh"
}

