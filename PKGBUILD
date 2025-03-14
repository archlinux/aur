# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Andy Alt <andy400-dev at yahoo dot com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=gimp-plugin-dcamnoise2
pkgver=0.64
pkgrel=9
pkgdesc="Removes noise from images"
arch=('i686' 'x86_64')
url="https://bitbucket.org/stativ/gimp-plugin-dcamnoise2/"
license=('GPL-2.0-or-later')
depends=('gimp')
source=("https://bitbucket.org/stativ/gimp-plugin-dcamnoise2/raw/a1de7f38cdce2fd65169f40db47704cb1885a831/dcamnoise2-${pkgver}.cpp")
sha256sums=('cde49c4b9f6bb4077ce660db95fcf5b24d828f39f796518977af460ffba4328c')

build() {
  cd "$srcdir"
  export LIBS="-lstdc++ -lm"
  gimptool-2.0 --build dcamnoise2-$pkgver.cpp
}

package() {
  cd "$srcdir"
  install -D -m755 dcamnoise2-$pkgver \
    "$pkgdir"/usr/lib/gimp/2.0/plug-ins/dcamnoise2
}
