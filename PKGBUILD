# Maintainer: kpcyrd <git@rxv.cc>

pkgname=sniffglue
pkgver=0.2.0
pkgrel=1
pkgdesc="Secure multithreaded packet sniffer"
url="https://github.com/kpcyrd/sniffglue"
depends=('libpcap')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('GPL3')
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('83e21d20b863bf588ca2603ac7053df585e84ade627268fbbf93c858fad33251')
sha512sums=('d9b679dddd9136f6c356a23def485b1a938f8c4d4158d683be8e8dd22c8dc095ddab46f707398b1015b74d115889f7627a8e95962dda53a1be6ab1edf9ad42f0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
