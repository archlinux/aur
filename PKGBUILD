# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org>

pkgname=sugar-runner-git
pkgver=v0.110.0.2.g6eebec3
pkgrel=1
pkgdesc="Scripts to run Sugar"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('GPL')
depends=('xorg-xinit' 'xorg-server-xephyr' 'xorg-xrandr')
makedepends=('gobject-introspection')
source=("git+https://github.com/sugarlabs/sugar-runner.git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname%-git}"
  chmod +x ./autogen.sh
  ./autogen.sh --prefix=/usr --with-python3
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
