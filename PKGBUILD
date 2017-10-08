pkgname=gtkplatform
pkgver=0.1.0
pkgrel=1
pkgdesc="Run Qt applications using gtk+ as a windowing system"
arch=('i686' 'x86_64')
url="https://github.com/CrimsonAS/gtkplatform"
license=('LGPL3' 'GPL2')
depends=('gtk3' 'libnotify' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CrimsonAS/gtkplatform/archive/$pkgver.tar.gz")
md5sums=('c3fc599753d4b93b7bfb5d4446f073dc')
sha512sums=('0100127e3546df3caf7698414051003ddc4e61d5b32a7ea0b129489237f9f74dfc0b5fd0148e66a89dfd372c6002554d5568f547054be42b557060e9114328e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
