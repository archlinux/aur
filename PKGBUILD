pkgname='gonchill'
pkgver=1.0.4
pkgrel=1
pkgdesc="A CLI tool for streaming content"
arch=('x86_64')
url="https://github.com/kbwhodat/gonchill"
license=('MIT')
depends=('peerflix')
makedepends=('go' 'git')
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kbwhodat/gonchill/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  go build -o "$pkgname" main.go
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
