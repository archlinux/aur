# Maintainer: minus <minus@mnus.de>

pkgname=sshign
pkgver=0.1.0
pkgrel=1
pkgdesc="Small program to sign & verify files with your SSH key"
arch=('any')
url="https://git.sr.ht/~minus/sshign"
license=('MIT')
makedepends=('go')
source=("https://git.sr.ht/~minus/sshign/archive/$pkgver.tar.gz")
sha256sums=('cef741b11e43d275a7366f5cfb56c570044f764ec3a2099262e2167f94468f0f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  GOPATH="$srcdir" make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
