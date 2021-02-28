# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=brightmare
pkgver=0.36
pkgrel=1
pkgdesc="A tool that translates LaTeX equations to ASCII/UTF-8 text"
arch=('i686' 'x86_64')
url="https://github.com/jwilk-archive/brightmare"
license=('MIT')
makedepends=('ocaml')
source=("https://github.com/jwilk-archive/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('ea51e0c664b9dcb621b26327a3d144d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
  cd doc
  make
}

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/brightmare" "$pkgdir/usr/bin/brightmare"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/doc/brightmare.1" "$pkgdir/usr/share/man/man1/brightmare.1"
}
