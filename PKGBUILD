# Maintainer: Kevin Saiger <kevin@saiger.dev>

pkgname=gozer
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast, opinionated and simple static site generator in a single static binary."
arch=('x86_64')
url="https://git.sr.ht/~dvko/gozer"
license=('MIT')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~dvko/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("7adbba4c24635c2312abd9f8db2c92f38c60b497b0860c2591fd7baa03cdc6d0")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  GOBIN=$pkgdir/usr/bin go install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
