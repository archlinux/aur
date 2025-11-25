# Maintainer: Niel Nielsen <nn@sec1.dk>
pkgname=aslookup
pkgver=1.4.0
pkgrel=1
arch=('x86_64')
pkgdesc="A command-line tool to resolve ASN information and IP ranges for a given IP address, using Cymru and BGPView APIs. Supports colored output and JSON parsing."
url="https://codeberg.org/nieldk/aslookup"
license=('0BSD')
depends=('curl' 'cjson')
source=("$pkgname.c")
sha256sums=('SKIP')

build() {
  gcc $pkgname.c -o $pkgname -lcurl -lcjson -lresolv
}

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
