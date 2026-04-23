# Maintainer: QurieGLord <https://github.com/QurieGLord/QTop>
pkgname=qtop
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern, responsive TUI system monitor written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/QurieGLord/QTop"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/master.tar.gz")
sha256sums=('6a6190304e8d7d4f47ca82fad0c6cd31900a33320551ba71b1eb401e11b68109')

build() {
  cd "QTop-master"
  export GOPATH="$srcdir/gopath"
  go build -o qtop ./cmd/qtop
}

package() {
  cd "QTop-master"
  install -Dm755 qtop "$pkgdir/usr/bin/qtop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
