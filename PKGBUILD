# Maintainer: Linux Gamers <linuxgamers@protonmail.com>

pkgname=jslisten-git
pkgver=r48.3c84610
pkgrel=1
epoch=1
pkgdesc="This program listen in the background for gamepad inputs. If a special button combination is getting pressed, the provided command line will be invoked."
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/workinghard/jslisten"
license=(GPL3)
depends=(udev)
makedepends=(git)
provides=(jslisten)
conflicts=(jslisten)
sha256sums=('SKIP')
source=("git+${url}")

pkgver() {
  cd "${srcdir}/jslisten"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/jslisten"
  make
}

package() {
  install -Dm755 "${srcdir}/jslisten/bin/jslisten" ${pkgdir}/usr/bin/jslisten
}
