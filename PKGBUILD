# Maintainer: Erich Eckner <arch at eckner dot net>
pkgname=nagircbot
pkgver=0.0.33
pkgrel=4
arch=('i686' 'pentium4' 'x86_64')
pkgdesc='IRC bot announcing Nagios status'
url='https://www.vanheusden.com/nagircbot/'
source=("https://www.vanheusden.com/$pkgname/$pkgname-$pkgver.tgz")
sha512sums=('1e4d69cef4a425e8540ff408688cf7899c04098ec47acbd6da601f48e01f808958982e7d8a1519934bd5aa895fe0f8dedc51d80460f85097355d5bdea79fd708')
license=(GPL)
depends=(openssl)

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 nagircbot -t "$pkgdir/usr/bin"
  install -Dm644 license.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
