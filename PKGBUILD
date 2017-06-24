# Maintainer: Quytelda Kahja <quytelda at tamalin dot org>
pkgname=babel
pkgver=2.0
pkgrel=1
pkgdesc="Babel randomly generates character strings based on context free grammars."
arch=('i686' 'x86_64')
license=('GPL')
depends=('ghc' 'haskell-random' 'haskell-parsec')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/quytelda/babel/archive/v${pkgver//_/-}.tar.gz")
md5sums=('788494cc53283f35617db241bdd2ab08')

build() {
	cd "$srcdir/$pkgname-${pkgver//_/-}"
	runhaskell Setup configure --prefix=/usr
	runhaskell Setup build
}

package() {
	cd "$srcdir/$pkgname-${pkgver//_/-}"
	runhaskell Setup copy --destdir="$pkgdir/"
}