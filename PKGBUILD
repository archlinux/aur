# Maintainer: Coelacanthus <coelacanthus@outlook.com>

# rename for same name package in [community]
pkgname=git-grc
_pkgname=gcr
pkgver=1.1.0
pkgrel=2
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
install=$pkgname.install
source=($_pkgname-$pkgver.tar.gz::https://github.com/sdttttt/$_pkgname/archive/v$pkgver.tar.gz)
b2sums=('fffc7220a9c00baffe9e489de5cf37b13a5d57d72d29ee1c8bdcc285c5ac5a1564704627a192675568c75cf8f6c390737fcba106146477c24afc5b812eb81737')

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

