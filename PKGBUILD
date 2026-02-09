# Maintainer: gomanager <gomanager@generated>
pkgname=paclear
pkgver=0.0.13
pkgrel=2
pkgdesc="👾paclear is a clear command with PAC-MAN animation👾"
arch=('x86_64' 'aarch64')
url="https://github.com/orangekame3/paclear"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/orangekame3/paclear.git#tag=v$pkgver")
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
