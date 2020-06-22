# Maintainer: Leonid Koftun <leonid.koftun@gmail.com>

pkgname=kafkactl
pkgver=1.9.0
pkgrel=1
pkgdesc='Command Line Tool for managing Apache Kafka'
arch=('i686' 'x86_64')
url="https://github.com/deviceinsight/kafkactl"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('eb89b65c9e3d62f70bcd6739cd539c1774271521d67117c58792a0d135b997b9')

build() {
  cd $pkgname-$pkgver
  go build \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
