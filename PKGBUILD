# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=centroid-rna-package
pkgver=0.0.15
pkgrel=2
pkgdesc="CentroidFold for predicting RNA secondary structures"
arch=('i686' 'x86_64')
url="https://github.com/satoken/centroid-rna-package"
license=('GPL')
depends=('boost-libs>=1.40.0')
makedepends=('viennarna>=1.8')
source=("https://github.com/satoken/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('dc333b18b7f4d353d667fe66d66404ba')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --with-vienna-rna
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
