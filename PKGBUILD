# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=bim
pkgver=2.5.1
pkgrel=1
pkgdesc='Inspired by Vim, originally written for ToaruOS'
arch=('x86_64')
license=('ISC')
url='https://github.com/klange/bim'
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/klange/bim/archive/v${pkgver}.tar.gz")
sha256sums=('dc380f8ebf19e0439f9de7c331a2d2947b0a59509a4baabfa37c5fc7331a640c')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	mkdir -p "$pkgdir/usr/share/licenses"

	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install

	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
