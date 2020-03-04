# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.4.34
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

sha256sums=('2101ab63df607843528533860e4b7865a9d13bf45c609833764e026e95d80201')
