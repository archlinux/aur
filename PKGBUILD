# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scdoc
pkgver=1.4.2
pkgrel=2
license=('MIT')
pkgdesc='tool for generating roff manual pages'
arch=("any")
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}")
sha512sums=('2fae9b68236a647b31c5a27d590d6f4015d12eca7388aeff4312885ae0c1b9b40d3117bd785cb78cf36cbf26650c079fc6598411fd069f03bd9d52013598f67a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
