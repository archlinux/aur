# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=bim
pkgver=2.1.1
pkgrel=0
pkgdesc='Inspired by Vim, originally written for ToaruOS'
arch=('x86_64')
license=('ISC')
url='https://github.com/klange/bim'
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/klange/bim/archive/v${pkgver}.tar.gz")
sha256sums=('39ce470e4841b6c12c011dd25dbf9ff56f12e1b68d2809ac5372198d16d47eab')

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
