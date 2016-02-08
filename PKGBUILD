pkgname='jmk-x11-fonts'
pkgdesc="Jim's Fonts for X"
pkgver='3.0'
pkgrel='2'
license=('GPL')
url='http://nikolas.us.to/jmkfonts/'
arch=('any')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7a99689be59eaf50742932ce27c8b41a99d10076adf9c2990e11745a873eec610257d50e844f8380658d340cf821724d459dc9b6b189666180596f2bf255957f')
makedepends=('imake' 'xorg-mkfontdir')

build () {
	cd "${pkgname}-${pkgver}"
	xmkmf
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
