# Maintainer: Keiran keiran0@proton.me
pkgname=archium
pkgver=1.5
pkgrel=1
pkgdesc="Archium is a wrapper for AUR helpers such as YAY and Paru"
arch=('x86_64')
url="https://github.com/KeiranScript/archium"
license=('GPL')
depends=('git' 'make' 'gcc')
source=(
  "git+https://github.com/KeiranScript/archium.git"
  "https://github.com/KeiranScript/archium/releases/download/v$pkgver/$pkgname-$pkgver-x86_64.tar.gz"
)

sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"
}

build() {
  cd "$srcdir/archium"
  make
}

_package() {
  install -Dm755 "$srcdir/archium/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

package() {
  cd "$srcdir/archium"
  _package
}

package_archium-bin() {
  cd "$srcdir"
  install -Dm755 "$srcdir/$pkgname-$pkgver-x86_64/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
