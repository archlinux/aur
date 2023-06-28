# Contributor: aksr <aksr at t-com dot me>

pkgname=smatch
pkgver=1.73
pkgrel=1
pkgdesc="static analysis tool for C"
arch=('i686' 'x86_64')
url="http://smatch.sourceforge.net/"
license=(GPL2)
makedepends=('git' 'llvm' 'sqlite3' 'gtk3' 'libxml2')
source=("$pkgname::git+https://repo.or.cz/smatch.git#tag=$pkgver")
b2sums=('SKIP')


build() {
  cd "$pkgname"
  make PREFIX="/usr"
}

check() {
  cd "$pkgname"
  make -k check PREFIX="/usr"
}

package() {
  cd "$pkgname"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
