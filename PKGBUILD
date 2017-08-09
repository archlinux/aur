# Maintainer: git-rep <git-rep@openmailbox.org>

pkgname=vmap
pkgver=0.1
pkgrel=1
pkgdesc="A Vulnerability-Exploit desktop finder."
arch=('i686' 'x86_64')
url="https://github.com/git-rep/vmap"
license=('GPL')
depends=('qt5-base' 'qt5-svg' 'openssl' 'libxml++')
source=("https://github.com/git-rep/vmap/archive/v0.1.tar.gz")
sha1sums=('2d679cff36f6b9939baef6b2cd86001c5ce44575')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
