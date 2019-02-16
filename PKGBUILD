# Maintainer : Alex Dewar <alex.dewar@gmx.co.uk>

pkgname=lifeograph
pkgver=1.5.1
_minorver=.1
pkgrel=1
pkgdesc="off-line and private journal and note taking application"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://launchpad.net/lifeograph"
depends=('gtkmm3' 'enchant' 'libgcrypt')
makedepends=('meson')
optdepends=()
install=$pkgname.install
options=()
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver$_minorver.tar.bz2")

sha256sums=('0d0384c9baa36a5016197e8dfa4ec12b0bd392dfd485f07158ddb3d7db2f2c82')

build() {
  arch-meson build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
