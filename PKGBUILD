# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=aftp-server
pkgver=2.0
pkgrel=1
pkgdesc="Very fast file transfering server"
arch=(i686 x86_64)
url="https://github.com/arthurzam/${pkgname}"
license=('GPL2')
depends=('openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arthurzam/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5bee63a58c961e0a2f7f0bd0431d9b65b2bb94e271fa64c34cbd9a4257c1a0f1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
 
package() {
  install -Dm755 "${srcdir}/$pkgname-$pkgver/$pkgname" "${pkgdir}/usr/bin/$pkgname"
  install -Dm 644 "${srcdir}/$pkgname-$pkgver/man.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  gzip "$pkgdir/usr/share/man/man1/$pkgname.1"
}
