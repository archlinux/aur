# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=pinger-indicator-git
makedepends=('go')
pkgrel=1
pkgver=r1.339b045
arch=(x86_64)
pkgdesc="A tray indicator that checks your internet with the ping command"
license=("mit")
options=(!strip)
url="https://github.com/lucasew/pinger-indicator"
source=("git+https://github.com/lucasew/pinger-indicator/")

sha256sums=("SKIP")

pkgver() {
  cd "pinger-indicator"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd pinger-indicator
    ./build.sh
    mkdir -p $pkgdir/usr/bin
    install -m0755 self $pkgdir/usr/bin/pinger-indicator
}
