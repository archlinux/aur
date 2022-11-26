# Contributor: Rose Kunkel <rose at rosekunkel dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-config
pkgver=0.5.1
pkgrel=3
pkgdesc='Configuration management library for GNU Guile'
arch=('x86_64')
url='https://gitlab.com/a-sassmannshausen/guile-config'
license=('GPL3')
depends=('guile')
source=("https://gitlab.com/a-sassmannshausen/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c30bb76bf27dcdbda7cc13733cf907e3b28d14dec2a55a89097514be61f3278e')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -vif
  GUILD=/usr/bin/guild ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
