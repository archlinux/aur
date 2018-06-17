# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scdoc
pkgver=1.3.4
pkgrel=1
license=('MIT')
pkgdesc='tool for generating roff manual pages'
arch=("any")
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("https://git.sr.ht/~sircmpwn/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz")
sha512sums=('9e53ed0f6149d130bfd7be22b8348a8983db85c59eb11e00c0e1089b489ed7356f2d4e6902be1d800a2fe450b7e7556d6e198e5032b4c08da00d935e216f9222')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
