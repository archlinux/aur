# Maintainer: X0rg
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>
# Contributor: Mildred <silkensedai@online.fr>
# Contributor: Pierre-Olivier Vauboin <povauboin at gmail dot com>

pkgname=libaosd
pkgver=0.2.7
pkgrel=2
pkgdesc="Atheme On Screen Display library"
arch=('i686' 'x86_64')
url="https://github.com/atheme/libaosd"
license=('MIT')
depends=('libxcomposite' 'pango')
source=("https://github.com/atheme/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b1d02cc5f1761ab6b1c1f8994a92466f11d91d57af65dcb3204e8c54ea514059')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
