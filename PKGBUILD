# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=prepress-cyan
pkgver=1.2.4
pkgrel=1
pkgdesc="Image viewer and converter, designed for prepress (print) work."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/rodlie/cyan"
license=('custom')
depends=('imagemagick' 'qt5-base')
makedepends=('cmake')
source=("https://github.com/rodlie/cyan/archive/refs/tags/$pkgver.tar.gz")
md5sums=('bb4e7d8098720302516d82aee891d0f6')

build() {
  cd "$srcdir/cyan-$pkgver"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/cyan-$pkgver"

  make DESTDIR="$pkgdir/" install
}
