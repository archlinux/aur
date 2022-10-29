# Maintainer: UnicornDarkness

pkgname=dmg2dir
pkgver=3.1.1
pkgrel=2
pkgdesc="A Bash script which extract macOS application from DMG file"
arch=('any')
url="https://github.com/TheTumultuousUnicornOfDarkness/dmg2dir"
license=('unknow')
depends=('dmg2img' 'udisks2')
optdepends=('cdrtools: to use --iso option'
	'darling: to use --run option')
source=("$pkgname-$pkgver::https://github.com/TheTumultuousUnicornOfDarkness/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('b5ef6b1c5e59d84456844dd440833d84bd1a0203116a9e100e4d7a5f7f010a48fd3049a895574fbe8090f01cedfe0d71ab5bd23412ee5fb5ecdeb087f00745c5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
