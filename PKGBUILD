# Maintainer: gomanager <gomanager@generated>
pkgname=cascadia
pkgver=1.5.0
pkgrel=2
pkgdesc="Go cascadia package command line CSS selector"
arch=('x86_64' 'aarch64')
url="https://github.com/suntong/cascadia"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/suntong/cascadia.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
