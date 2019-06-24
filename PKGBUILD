# Maintainer: Ilya O. <evilbunny.x@gmail.com>
pkgname=stancli
pkgver=0.0.1
pkgrel=2
pkgdesc="A cli utility for send arbitrary messages to nats-streaming"
arch=('i686' 'x86_64')
url="https://github.com/vasyahuyasa/stancli"
license=('MIT')
depends=(
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vasyahuyasa/stancli/archive/v${pkgver}.tar.gz")
sha1sums=('bbb2e4ee61189a61ecd433297e43d6b8524c5616')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CGO_ENABLED=0 go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
