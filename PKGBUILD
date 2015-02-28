# Maintainer: X0rg

pkgname=dmg2dir
pkgver=3.0.2
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
md5sums=('aeae2d3836fdfed04dafca55046584d1')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
