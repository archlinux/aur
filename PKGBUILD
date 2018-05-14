# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scdoc
pkgver=1.3.2
pkgrel=1
license=('MIT')
pkgdesc='tool for generating roff manual pages'
arch=("any")
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("https://git.sr.ht/~sircmpwn/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz")
sha512sums=('10db14745674cbf05849ff5b3c294a9d965a2e2f9c46bf8836f50d3f1f5e7c59e338ac19e1c6da9d87e1b252deef986abbdb7fd42acf633655e8f488aa926838')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
