# Maintainer: gomanager <gomanager@generated>
pkgname=madonctl
pkgver=3.0.3
pkgrel=2
pkgdesc="CLI client for the Mastodon social network API"
arch=('x86_64' 'aarch64')
url="https://github.com/McKael/madonctl"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/McKael/madonctl.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
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
