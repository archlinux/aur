pkgname=gtkplatform
pkgver=0.2.1
pkgrel=1
pkgdesc="Run Qt applications using gtk+ as a windowing system"
arch=('i686' 'x86_64')
url="https://github.com/CrimsonAS/gtkplatform"
license=('LGPL3' 'GPL2')
depends=('gtk3' 'libnotify' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CrimsonAS/gtkplatform/archive/$pkgver.tar.gz")
md5sums=('d1653ffcc138e2b26e63eae25283e00c')
sha512sums=('5463fce60acf21b2fa6b8e4963e4e236594cbdfbca672b117b3bc7f00315958ee0baea523e601aa7f6f2f8ed9c590e0c0cbe15f6c8a3302bc0d35ec3bd07e5f7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
