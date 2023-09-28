# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=matchbox-keyboard
pkgver=0.1.1
pkgrel=1
pkgdesc="An on screen virtual keyboard"
arch=('x86_64')
depends=('cairo' 'libfakekey' 'libxft')
url="https://www.yoctoproject.org/software-item/matchbox"
license=('LGPL2.1')
source=("https://git.yoctoproject.org/matchbox-keyboard/snapshot/matchbox-keyboard-$pkgver.tar.gz")
sha256sums=('dd3e9494a9499a3bf3017c8c1e6572a4e91deb20e219717db17c0977750b8bcb')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
