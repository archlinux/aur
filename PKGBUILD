# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=sigviewer
pkgver=0.5.2
pkgrel=1
pkgdesc="A biosignal viewer"
arch=('i686' 'x86_64')
url="https://github.com/cbrnr/sigviewer"
license=('GPL')
groups=()
depends=('qt4' 'libbiosig')
makedepends=('')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver-src.tar.gz
        zoom_gui_command.patch)
noextract=()
sha1sums=('bc4622c23d7fde98f24bd979b6c61e9f0a2d1627'
          'cb023fde0a4e87be137fad514990c966681e63ea')

build() {
  cd "$srcdir/$pkgname-$pkgver-src"
  patch -p0 < ../../zoom_gui_command.patch
  qmake-qt4
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/$pkgname-$pkgver-src/bin/release/sigviewer" "$pkgdir/usr/bin"
}
