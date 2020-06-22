# Maintainer: Leonid Koftun <leonid.koftun@gmail.com>

pkgname=kafkactl
pkgver=1.5.0
pkgrel=1
pkgdesc='Command Line Tool for managing Apache Kafka'
arch=('i686' 'x86_64')
url="https://github.com/deviceinsight/kafkactl"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('6e62ba3398f9d456e6b764af674077e7a50535736a31af8e64167a95b957242c')

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
