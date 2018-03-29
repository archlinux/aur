# Maintainer: X0rg

pkgname=dmg2dir
pkgver=3.0.3
pkgrel=1
pkgdesc="A shell script which extract OS X application from .dmg file"
arch=('any')
url="https://github.com/X0rg/dmg2dir"
license=('unknow')
depends=('dmg2img' 'udisks2')
optdepends=('darling-git: to use --run'
	'cdrtools: to use --iso (if no cdrkit)'
	'cdrkit: to use --iso (if no cdrtools)')
source=("$pkgname-$pkgver::https://github.com/X0rg/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('45b84263962ce2f10c75d58cab68347fd95a268cc02fb01e5bbcb38bb35fb60eb47572685649fad5b8d1c5d07a56ff3f9deb9cbb3582ece1d85d30786a21f208')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
