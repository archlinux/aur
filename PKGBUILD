# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scdoc
pkgver=1.2.2
pkgrel=1
license=('MIT')
pkgdesc='tool for generating roff manual pages'
arch=("any")
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("https://git.sr.ht/~sircmpwn/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz")
sha512sums=('126812d1b53b923de88259fe52ab6fbb1763710ea51c3de29497ff1db8a3d047d5c27a994a1dd2791ddd919922b0fadf42c1f13293a5c02ad4658228a5a698e2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
