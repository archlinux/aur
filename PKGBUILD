# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.5.1
pkgrel=2
pkgdesc='NextDNS DNS-over-HTTPS client'
arch=('x86_64')
url='https://github.com/nextdns/nextdns'
license=('MIT')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz" "nextdns.service")
sha256sums=('@checksum@')

build() {
  cd $pkgname-$pkgver
  go build     -trimpath     -ldflags "-X main.version=$pkgver -extldflags $LDFLAGS"     -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

sha256sums=('ee0059ee0723a2755de933abc45ac0923bf473b6cb0bab66343cf3cb408a7d7f'
            'e15d83ec460562c8a81052f37c0e78e18842e95270895524b9853f7aca285eba')
