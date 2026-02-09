# Maintainer: gomanager <gomanager@generated>
pkgname=gotouch
pkgver=1.16.2
pkgrel=2
pkgdesc="Language Agnostic Customizable Boilerplate Project Creator"
arch=('x86_64' 'aarch64')
url="https://github.com/denizgursoy/gotouch"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/denizgursoy/gotouch.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/gotouch
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
