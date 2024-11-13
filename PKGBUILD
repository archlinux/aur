# Maintainer: Kevin Saiger <kevin@saiger.dev>

pkgname=gozer
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast, opinionated and simple static site generator in a single static binary."
arch=('x86_64')
url="https://git.sr.ht/~dvko/gozer"
license=('MIT')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~dvko/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("27dd6e0e72092e4a946e7e65ec8b36c2869a0ace80730e5ea3739a814159b88e")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  GOBIN=$pkgdir/usr/bin go install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
