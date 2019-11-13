# Maintainer: Leonid Koftun <leonid.koftun@gmail.com>

pkgname=kafkactl
pkgver=1.3.0
pkgrel=2
pkgdesc='Command Line Tool for managing Apache Kafka'
arch=('i686' 'x86_64')
url="https://github.com/deviceinsight/kafkactl"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('99b19bd0fb33dc46d62034962934a9cb8463efd2cc422f35f2c6a64bc0deeb2c')

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
