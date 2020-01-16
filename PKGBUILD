# Maintainer : Alex Dewar <alex.dewar@gmx.co.uk>

pkgname=lifeograph
pkgver=1.6.1
pkgrel=1
pkgdesc="off-line and private journal and note taking application"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://launchpad.net/lifeograph"
depends=('gtkmm3' 'enchant' 'libgcrypt' 'xdg-utils')
makedepends=('meson')
optdepends=()
install=$pkgname.install
options=()
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.xz")

sha256sums=('7e40678600587156635da3bffae72694711c25290acf924025cfd14b970ed7cd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  arch-meson build
  ninja -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
