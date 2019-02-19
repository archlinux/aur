# Maintainer: Adrian Petrescu <apetresc at gmail.com>
pkgname=termpub
pkgver=1.03
pkgrel=1
pkgdesc="Epubreader for the terminal"
arch=(x86_64)
url="https://github.com/mdom/termpub"
license=('GPL')
depends=('perl' 'perl-mojolicious' 'perl-curses' 'perl-archive-zip')
source=("https://github.com/mdom/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('e766ddd1c3993e6dc850e56d695c2505')


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
