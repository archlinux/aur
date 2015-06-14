# Maintainer: Jouke Witteveen <j.witteveen@gmail.com>

pkgname=xlogin-git
pkgver=8
pkgrel=1
pkgdesc="X login service for systemd"
url="https://github.com/joukewitteveen/xlogin"
license=("BSD")
depends=("systemd" "xorg-server" "bash")
makedepends=("git")
provides=("xlogin")
conflicts=("xlogin")
source=("git://github.com/joukewitteveen/xlogin.git")
arch=(any)
md5sums=("SKIP")

pkgver() {
  cd xlogin
  git rev-list HEAD --count
}

package() {
  cd xlogin
  make DESTDIR="$pkgdir" install
}
