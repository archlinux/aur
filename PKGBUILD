# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scdoc
pkgver=1.5.2
pkgrel=2
license=('MIT')
pkgdesc='tool for generating roff manual pages'
arch=("any")
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('10fa7dcc3e9303bae4e284b024d36504dde6b0cf9d4551d7319b96f4d9efd8f1605a0283f44cf4164ec4ec487f179a650b6bf8093ce3d301427c25211bae37df')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
