# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=ipknot
pkgver=0.0.4
pkgrel=2
pkgdesc="IPknot for predicting RNA pseudoknot structures using integer programming"
arch=('i686' 'x86_64')
url="http://rtips.dna.bio.keio.ac.jp/ipknot/"
license=('GPL')
depends=('glpk>=4.41')
makedepends=('viennarna>=1.8')
source=("https://github.com/satoken/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('4d751cbb7d0ad2e784faf77165aff561')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --with-vienna-rna --with-glpk
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
