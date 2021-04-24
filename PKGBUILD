# Maintainer: Coelacanthus <coelacanthus@outlook.com>

# rename for same name package in [community]
pkgname=git-grc
_pkgname=gcr
pkgver=1.2.1
pkgrel=1
pkgdesc="Semantic git commits tool. use rust to rewrite the main features of git-cz."
#epoch=0
arch=('i686' 'x86_64')
url="https://github.com/sdttttt/gcr"
license=(MIT)
depends=('gcc-libs'
         'git'
         )
makedepends=(cargo)
optdepends=()
# conflict for same file: /usr/bin/grc
conflicts=(grc)
install=$pkgname.install
source=($_pkgname-$pkgver.tar.gz::https://github.com/sdttttt/$_pkgname/archive/v$pkgver.tar.gz)
b2sums=('8855456eb2126337c660692f976f3e30d247749dfc8af6d1bea7e3be52de28d8d97a7b3d9a03cb89bf9501ace5676d653888b53cb8b82686e532371ec2d4b526')

prepare() {
	return 0
}

build() {
	return 0
}

package() {
	cd "$_pkgname-$pkgver"
	cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
	#ln -sf "$pkgdir/usr/bin/grc" "$pkgdir/usr/bin/git-cz"
	ln -sf "$pkgdir/usr/bin/grc" "$pkgdir/usr/bin/git-grc"

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

