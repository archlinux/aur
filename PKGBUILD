# Maintainer: minus <minus@mnus.de>

pkgname=sshign
pkgver=0.2.1
pkgrel=1
pkgdesc="Small program to sign & verify files with your SSH key"
arch=('any')
url="https://git.sr.ht/~minus/sshign"
license=('MIT')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~minus/sshign/archive/$pkgver.tar.gz")
sha256sums=('baa7654788e850523a55ee5568cc7c1cbc87f3d5468a34df54fe8fc8cfad3d03')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  GOPATH="$srcdir" make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
