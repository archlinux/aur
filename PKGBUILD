# Maintainer: gomanager <gomanager@generated>
pkgname=world-cup-2022-cli-dashboard
pkgver=1.4.0
pkgrel=2
pkgdesc="Watch live World Cup 2022 matches in your terminal. ⚽🏆"
arch=('x86_64' 'aarch64')
url="https://github.com/cedricblondeau/world-cup-2022-cli-dashboard"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/cedricblondeau/world-cup-2022-cli-dashboard.git#tag=v$pkgver")
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
