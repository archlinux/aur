# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scdoc
pkgver=1.2.1
pkgrel=1
license=('MIT')
pkgdesc='tool for generating roff manual pages'
arch=("any")
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("https://git.sr.ht/~sircmpwn/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz")
sha512sums=('1049d4d0efe1802778612848f13d1706c3a43a1026db9789f0ae91737a3801fb67282150322dbac3fcd874220fc2f9d2429d4bc35b7c5af68a70b490107ebd70')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
