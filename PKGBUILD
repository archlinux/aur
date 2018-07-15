# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=rofimgur-git
pkgver=r9.daf1439
pkgrel=1
pkgdesc="Upload screenshots to imgur anonymously using rofi"
arch=("any")
url="https://github.com/cjbassi/rofimgur"
license=("MIT")
depends=("rofi" "maim" "curl" "xclip" "xdotool")
makedepends=("git")
provides=("rofimgur")
source=("git+https://github.com/cjbassi/rofimgur")
md5sums=("SKIP")

name=rofimgur

pkgver() {
  cd "$name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mv $srcdir/$name/$name $pkgdir/usr/bin
}
