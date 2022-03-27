# Maintainer: Jouke Witteveen <j.witteveen@gmail.com>

pkgname=xlogin-git
pkgver=14
pkgrel=1
pkgdesc="X login service for systemd"
url="https://github.com/joukewitteveen/xlogin"
license=("BSD")
arch=("any")
depends=("systemd" "xorg-server" "bash")
makedepends=("git")
provides=("xlogin")
conflicts=("xlogin")
source=("git+https://github.com/joukewitteveen/xlogin.git")
md5sums=("SKIP")

pkgver() {
  cd xlogin
  git rev-list HEAD --count
}

package() {
  cd xlogin
  make DESTDIR="$pkgdir" install
}
