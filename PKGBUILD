# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scdoc
pkgver=1.5.2
pkgrel=1
license=('MIT')
pkgdesc='tool for generating roff manual pages'
arch=("any")
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('755c1c7fbae6cbeb75ca2aa2498cb3b2cf644e5118188c3e4a4636d74764b475b1818dcb5bd08ff70e017af9c1f8cb2e351db36a2cc98885724731e4247201eb')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
