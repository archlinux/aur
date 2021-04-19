# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=skydroid-cli
pkgver=0.1.3
pkgrel=1
pkgdesc="Command-line tool for SkyDroid app distribution."
arch=('x86_64')
url="https://github.com/redsolver/skydroid-cli"
license=('MIT')
depends=('glibc')
makedepends=('dart')
conflicts=("$pkgname-git")
replaces=("$pkgname-git")
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/redsolver/skydroid-cli/archive/refs/tags/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	dart pub get
	dart2native bin/skydroid.dart -o "$pkgname"
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('5d2c6fccde4e0dc2495c94f7b92b24d3')
