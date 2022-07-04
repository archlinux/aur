# Maintainer: madprops <mprops at protonmail dot com>

pkgname="clipton-git"
pkgdesc="Clipboard manager based on rofi"
pkgver=r79.6e14e49
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/clipton"
license=("Unlicense")
depends=("rofi" "clipnotify" "xclip")
sha256sums=("SKIP")
source=("$pkgname::git+https://github.com/madprops/clipton.git")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd clipton-git
  install -D -m755 clipton.py "$pkgdir/usr/bin/clipton"
  install -D -m644 clipton.service "$pkgdir/usr/lib/systemd/user/clipton.service"
}
