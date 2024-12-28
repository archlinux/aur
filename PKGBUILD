# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
pkgname=stride
# pkgver foundin doc/relnotes.doc
pkgver=19960129
pkgrel=1
pkgdesc="Protein secondary structure assignment from atomic coordinates"
arch=('x86_64')
url='https://webclu.bio.wzw.tum.de/stride/'
license=(LicenseRef-stride)
makedepends=(
	gcc
	make
)

depends=(
	glibc
)

b2sums=(
	'0a6fbb7da0a18cc9fbc4beb3214488080e5f6b85b93f87a33f3d6c38385da12707ee0eb2a10a86c9f6dd3884bd043e3f7f36c6aac797da7dc4f351fab047a950'
)

source=(
	'https://webclu.bio.wzw.tum.de/stride/stride.tar.gz'
)

build() {
	make
}

package() {
	install -Dm755 stride "${pkgdir}/usr/bin/stride"

	install -Dm644 doc/stride.doc "${pkgdir}/usr/share/licenses/${pkgname}/stride.doc"

	install -Dm644 HOW_TO_USER_STRIDE_FOR_CONTACT_ORDER_CALCULATIONS "${pkgdir}/usr/share/${pkgname}/HOW_TO_USER_STRIDE_FOR_CONTACT_ORDER_CALCULATIONS"

	mkdir -p "${pkgdir}/usr/share/${pkgname}/doc"

	install -Dm644 doc/notes.dos "${pkgdir}/usr/share/${pkgname}/doc/notes.dos"
	install -Dm644 doc/notes.mac "${pkgdir}/usr/share/${pkgname}/doc/notes.mac"
	install -Dm644 doc/relnotes.doc "${pkgdir}/usr/share/${pkgname}/doc/relnotes.doc"
	install -Dm644 doc/stride.doc "${pkgdir}/usr/share/${pkgname}/doc/stride.doc"
}
