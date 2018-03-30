# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=vim-anywhere-git
pkgver=r3.b6524e8
pkgrel=1
pkgdesc="Script that allows you to never edit text outside Vim again"
arch=("any")
url="https://github.com/cjbassi/vim-anywhere"
license=("MIT")
depends=("xclip" "xdotool")
provides=("vim-anywhere")
source=("git+https://github.com/cjbassi/vim-anywhere")
md5sums=("SKIP")

pkgver() {
  cd "vim-anywhere"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mv $srcdir/vim-anywhere/vim-anywhere $pkgdir/usr/bin
}
