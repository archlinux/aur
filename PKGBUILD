# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=libp7
pkgver=1.3
pkgrel=1
pkgdesc="Casio Communication Protocol 7.00 implementation"
arch=('i686' 'x86_64')
url="https://forge.touhey.fr/lib/libp7/"
license=('GPL2')
groups=()
depends=('libusb')
makedepends=('make' 'gcc' 'asciidoc' 'gzip' 'binutils')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://forge.touhey.fr/lib/$pkgname/snapshot/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('4d59601f704771943e1bc0d207b22bd4')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=$pkgdir/usr --udevrulesdir=$pkgdir/etc/udev/rules.d
  make all all-doc
}

package() {
  cd "$pkgname-$pkgver"

  make install install-doc
}
