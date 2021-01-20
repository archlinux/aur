# Maintainer: Leonid Koftun <leonid.koftun@gmail.com>

pkgname=kafkactl
pkgver=1.15.1
pkgrel=1
pkgdesc='Command Line Tool for managing Apache Kafka'
arch=('i686' 'x86_64')
url="https://github.com/deviceinsight/kafkactl"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('a648f0ae6fdc37cd14f6792c4899ae2e9cc5f126ee7bbd1884b77e07489d062a')

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
