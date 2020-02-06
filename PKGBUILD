# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.4.27
pkgrel=1
pkgdesc='NextDNS DNS-over-HTTPS client'
arch=('x86_64')
url='https://github.com/nextdns/nextdns'
license=('MIT')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('@checksum@')
install=$pkgname.install

build() {
  cd $pkgname-$pkgver
  go build     -trimpath     -ldflags "-X main.version=$pkgver -extldflags $LDFLAGS"     -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

sha256sums=('73fa28b77ea3c02b2cde2f6b3516597391ff073d70a4511a8125d6afda14ba3b')
