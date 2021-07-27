# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=0.1.1
pkgrel=1
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~arivigo/sline/'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('336a87fbf58b242e9c02a6ab3f5b6bfe283cb30c797e019dd15afc4c1601fb5186c9295dc9468fb33d07bc4b200a72a31ca131555acb587f6dd1cb9a29d04f1f')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
