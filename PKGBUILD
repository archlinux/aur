# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=libp7
pkgver=1.2
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
md5sums=('da4d02167c7884b7892ef2f709cfb7cc')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=$pkgdir/usr --udevrulesdir=$pkgdir/etc/udev/rules.d
  make all all-doc
}

package() {
  cd "$pkgname-$pkgver"

  make install install-doc
}
