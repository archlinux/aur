# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=pamlx
_pkgname=pamlX
pkgver=1.3.1
pkgrel=1
pkgdesc="A Graphical User Interface for PAML https://doi.org/10.1093/molbev/mst179"
arch=('x86_64')
url="http://abacus.gene.ucl.ac.uk/software/"
license=('custom')
depends=('qt4' 'paml')
makedepends=('make')
provides=('pamlx')
source=("http://abacus.gene.ucl.ac.uk/software/pamlX${pkgver}-src.tgz" "pamlX.desktop")
sha256sums=('e6abbbc715aff1d9ebcb6d9b7c2fb494f916bee53f9cf807bf38cebc7bd625bf'
            '4d46c866094df95b23d087acf402528326497308d2aeab0d8bd63f18a2f64550')
build() {
	cd $_pkgname$pkgver-src
	qmake-qt4
	make
}

package() {
	mkdir -p $pkgdir/usr/{bin,share/{icons,applications}}
	install -Dm 755 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
	cd $_pkgname$pkgver-src
	install -Dm 755 $_pkgname $pkgdir/usr/bin/$_pkgname
	install -Dm755 pamlxlogo.png $pkgdir/usr/share/icons/$_pkgname.png
}

