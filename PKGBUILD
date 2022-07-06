# Maintainer: madprops <mprops at protonmail dot com>

pkgname="clipton-git"
pkgdesc="Clipboard manager based on rofi"
pkgver=r81.db95e7b
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/clipton"
license=("Unlicense")
depends=("rofi" "xclip" "copyevent-git")
makedepends=("git")
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
