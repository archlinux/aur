# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scdoc
pkgver=1.4.2
pkgrel=1
license=('MIT')
pkgdesc='tool for generating roff manual pages'
arch=("any")
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("https://git.sr.ht/~sircmpwn/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz")
sha512sums=('cd477a8185256ac5ef9211113a1a8860aabe66ef47d74cae01cc3087da970cef3da4967a108ceb7346018b002cbc2a54b6776738891e7f471e15828a5ae26475')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
