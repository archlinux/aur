pkgname=ghpkg
pkgver=2.1.1
pkgrel=1
pkgdesc="Indev package manager"
arch=('any')
url="https://github.com/Frothy7650/ghpkg/"
license=('MIT')
source=("https://github.com/Frothy7650/ghpkg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0734497e6038eafccbee5cb88660b37c9543877c80fffc6a00a26bfd56a66606')
depends=('git')
makedepends=('vlang' 'clang')
options=('!debug')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make aur
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 src/ghpkg "$pkgdir/usr/bin/ghpkg"
  install -Dm644 db.json "$pkgdir/etc/ghpkg/db.json"
}
