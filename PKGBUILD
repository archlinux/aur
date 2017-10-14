pkgname=gtkplatform
pkgver=0.2.0
pkgrel=1
pkgdesc="Run Qt applications using gtk+ as a windowing system"
arch=('i686' 'x86_64')
url="https://github.com/CrimsonAS/gtkplatform"
license=('LGPL3' 'GPL2')
depends=('gtk3' 'libnotify' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CrimsonAS/gtkplatform/archive/$pkgver.tar.gz")
md5sums=('c9abdeabf9da5e6bc273e25641c955a5')
sha512sums=('14207199ca44803a27f1bfc09a8214d3a33820d786adf5ddd3017be91c562289fb51dcbb2187df3a6a1eccde06b7b36b2f3115e44c4c82c170088992cd554c6b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
