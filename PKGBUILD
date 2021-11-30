# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=kirc
pkgver=0.2.9
pkgrel=1
pkgdesc="A tiny IRC client written in POSIX C99"
arch=('x86_64')
url="https://github.com/mcpcpc/kirc"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a815f64576a750a90f2e6ed3bffbcd910a216d7316e0ec9a9baae1e1bdb4980c8e9754624632b6868291dc300d8212cf7228bcdad98816789edb69db0c174759')
b2sums=('5ec1a58b14df2b9dac300c7c487abc9119a1fcdbba3997d1fb75c83d7cd1623afac0ffdb738abad5ae9169fdf96680b834c739136d1fa8b55af7d536153fa23d')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
