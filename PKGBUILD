# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=arrowkeyoracle
pkgver=1.0.0
pkgrel=1
pkgdesc='Predict if the user is going to press the left or the right arrow key'
arch=(x86_64)
url='https://github.com/xyproto/arrowkeyoracle'
license=(BSD)
makedepends=(git go)
source=("git+$url#commit=cb09f2066ca67f23f81bae4ae54f5c4ba3cea73b") # tag: v1.0.0
b2sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags $LDFLAGS"
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
