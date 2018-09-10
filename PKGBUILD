# Maintainer: X0rg

pkgname=dmg2dir
pkgver=3.1.0
pkgrel=1
pkgdesc="A Bash script which extract macOS application from DMG file"
arch=('any')
url="https://github.com/X0rg/dmg2dir"
license=('unknow')
depends=('dmg2img' 'udisks2')
optdepends=('cdrtools: to use --iso option'
	'darling-git: to use --run option')
source=("$pkgname-$pkgver::https://github.com/X0rg/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('9d90041e65cd46cc925f187a792f166db6fd288f99256ba5145f7714d5a232a2908833f3e8c00ae1ffec8fdb60881b070ced435ac855b88435c8a04e25ae2453')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
