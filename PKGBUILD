pkgname=gtkplatform
pkgver=0.2.2
pkgrel=1
pkgdesc="Run Qt applications using gtk+ as a windowing system"
arch=('i686' 'x86_64')
url="https://github.com/CrimsonAS/gtkplatform"
license=('LGPL3' 'GPL2')
depends=('gtk3' 'libnotify' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CrimsonAS/gtkplatform/archive/$pkgver.tar.gz")
md5sums=('85df563ff7176a2b1e55bf01c3a86bbc')
sha512sums=('713ef45b63f37c0cb04b0fdc59b96ad8c5ce84d4fa49d2c76addbff4d6e7b85220bc4ef53e73556a1c2ba597c4d857b453b4529d82b6a78c869233bcbcbf8c3a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
