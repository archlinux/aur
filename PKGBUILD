# Maintainer: Loïc Escales <L0L022@openmailbox.org>
pkgname=let-me-do
pkgver=0.0
pkgrel=1
pkgdesc="Let someone else take control of your computer"
arch=('any')
url="https://l0l022.github.io/let-me-do/"
license=('GPL3')
depends=('polkit' 'openssh' 'iptables' 'xclip' 'zenity' 'miniupnpc' 'x11vnc' 'gettext' 'xdg-utils')
makedepends=('cmake' 'git')
source=("$pkgname"::"git+https://github.com/L0L022/let-me-do.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
