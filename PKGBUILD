# Maintainer: gomanager <gomanager@generated>
pkgname=cloud189
pkgver=0.6.7
pkgrel=2
pkgdesc="基于天翼云接口的go客户端"
arch=('x86_64' 'aarch64')
url="https://github.com/gowsp/cloud189"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/gowsp/cloud189.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/cloud189
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
