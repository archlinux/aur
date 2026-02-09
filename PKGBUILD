# Maintainer: gomanager <gomanager@generated>
pkgname=sqsmover
pkgver=0.4.0
pkgrel=2
pkgdesc="AWS SQS Message mover"
arch=('x86_64' 'aarch64')
url="https://github.com/mercury2269/sqsmover"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/mercury2269/sqsmover.git#tag=v$pkgver")
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
  install -Dm 644 README.MD -t "$pkgdir/usr/share/doc/$pkgname"
}
