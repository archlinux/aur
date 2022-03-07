# Maintainer: Krishna <krishna404@yandex.com>
pkgname='fm6000'
pkgver=6000
pkgrel=1
pkgdesc="Simple Dilbert themed system info-fetching tool"
arch=('x86_64')
url="https://github.com/anhsirk0/fetch-master-6000"
license=('GPL')
groups=()
depends=('perl')
makedepends=('git')
provides=('fm6000')
conflicts=('fm6000-bin')
source=('fm6000::git://github.com/anhsirk0/fetch-master-6000.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm755 ./fm6000.pl "$pkgdir/usr/bin/fm6000"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
