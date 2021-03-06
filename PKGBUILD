# Maintainer: Kacper Piwiński <cosiekvfj@o2.pl>

pkgname=tgui
pkgver=v0.9.1
pkgrel=1
pkgdesc="Cross-platform C++ GUI library for SFML"
arch=('i686' 'x86_64')
url="https://tgui.eu/"
license=('ZLIB')
depends=('sfml')
makedepends=('coreutils' 'make' 'cmake')

source=("https://github.com/texus/TGUI/archive/v0.9.1.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/TGUI-0.9.1"
  cmake -DCMAKE_INSTALL_PREFIX=/usr . \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=true
  make
}

package() {
  cd "$srcdir/TGUI-0.9.1"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ./license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
