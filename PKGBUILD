pkgname=gsteg
pkgver=0.1
pkgrel=1
pkgdesc="Steganography application in Gtk"
arch=('any')
url="https://www.github.com/elken/GSteg"
license=('BSD')
depends=('cmake' 'gtkmm3')
makedepends=('git')
install=
source=("gsteg::git+https://github.com/elken/GSteg")
md5sums=('SKIP') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname"
  cmake .
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 gsteg "$pkgdir/usr/bin/gsteg"
}
