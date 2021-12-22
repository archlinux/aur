# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=mrmodeltest
_pkgname=MrModeltest2
pkgver=2.4
pkgrel=1
pkgdesc="C program for selecting DNA substitution models using PAUP*"
arch=('x86_64')
url="https://github.com/nylander/MrModeltest2"
license=('GPL')
depends=('glibc')
makedepends=('make')
provides=('mrmodeltest')
source=("https://github.com/nylander/MrModeltest2/archive/refs/tags/v.${pkgver}.zip")
sha256sums=('d510abcd982add185225b400db530ffadb17ca0773bae9b2505411aaf1b72944')

build() {
	cd "$_pkgname-v.$pkgver"/src
	make
}

package() {
	cd "$_pkgname-v.$pkgver"/src
	install -Dm 755 mrmodeltest2 $pkgdir/usr/bin/mrmodeltest2
}
