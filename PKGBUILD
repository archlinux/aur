# Maintainer: kpcyrd <git@rxv.cc>

pkgname=sniffglue
pkgver=0.1.0
pkgrel=1
pkgdesc="Secure multithreaded packet sniffer"
url="https://github.com/kpcyrd/sniffglue"
depends=('libpcap')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5231acbd94fa22d29a69dd746ecdf1dd20afd8c8283f95cf16690d53581ccac1')
sha512sums=('7425fc5f7b33fbd69f8a5dce9abb2cb98b1288361a1dc6b9229aae938fded1667b13b49d5e1b81a4507bb5689d5fcc2feefa1df5fd7f1110608b5a628e1263c0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
