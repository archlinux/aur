# Maintainer: Leonid Koftun <leonid.koftun@gmail.com>

pkgname=kafkactl
pkgver=1.14.0
pkgrel=1
pkgdesc='Command Line Tool for managing Apache Kafka'
arch=('i686' 'x86_64')
url="https://github.com/deviceinsight/kafkactl"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('34841249e5434871444671adb4ab98668b1d3ad2305422175b3a029dd3f1e12d')

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
