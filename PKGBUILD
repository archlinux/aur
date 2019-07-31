# Maintainer: Adrian Petrescu <apetresc at gmail.com>
pkgname=termpub
pkgver=1.06
pkgrel=1
pkgdesc="Epubreader for the terminal"
arch=(x86_64)
url="https://github.com/mdom/termpub"
license=('GPL')
depends=('perl' 'perl-mojolicious' 'perl-curses' 'perl-archive-zip')
source=("https://github.com/mdom/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('633265a0d64f05bd0896e8062945d36e')


build() {
  cd "$pkgname-$pkgver"
  ./build-standalone
}

check() {
  cd "$pkgname-$pkgver"
  [ -f ./termpub ]
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "termpub" "$pkgdir"/usr/bin/termpub
}
