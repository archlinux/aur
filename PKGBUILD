# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=hx
pkgver=1.0.11
pkgrel=1
pkgdesc='Hex editor for the terminal using plain C99 + POSIX libs'
arch=('x86_64')
url='https://github.com/krpors/hx'
license=('MIT')
source=("https://github.com/krpors/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('18531b79e84d02e6e5a198cc132ac0caeb098eae68ac4bfc1319cd2d63fab9dc')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
