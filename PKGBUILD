# Maintainer: Lukas Epple <post@lukasepple.de>

_pkgname=rainbow-lollipop
pkgname="$_pkgname-git"
pkgver=391+ga682ca3
pkgrel=5
pkgdesc="the visual history browser"
arch=('i686' 'x86_64')
url="http://rainbow-lollipop.de"
license=('GPL3')
depends=('libgee' 'zeromq' 'webkit2gtk' 'clutter-gtk' 'desktop-file-utils' 'libhttpseverywhere-git')
makedepends=('git' 'cmake' 'make' 'vala' 'gettext')
conflicts=('rainbow-lollipop')
provides=('rainbow-lollipop')
source=(git+https://github.com/grindhold/rainbow-lollipop.git)
md5sums=(SKIP)
install=rainbow-lollipop.install

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install
}
