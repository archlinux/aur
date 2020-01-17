# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: sebikul <sebikul@gmail.com>
# Contributor: Gergely Tamas <dice@mfa.kfki.hu>

pkgname=afio
pkgver=2.5.2
pkgrel=2
pkgdesc='Archiver & backup program with builtin compression'
url='http://members.chello.nl/~k.holtman/afio.html'
arch=('i686' 'x86_64')
license=('custom')
# upstream is not available, so use fossies archive...
source=("https://fossies.org/linux/misc/${pkgname}-${pkgver}.tgz"
	'LICENSE')
sha256sums=('c64ca14109df547e25702c9f3a9ca877881cd4bf38dcbe90fbd09c8d294f42b9'
            'd34be83fc92406bd5b3a8d3ac17b47e77d2795a1d833ce9ee0b33a17de21abfa')

build() {
	cd "${pkgname}-${pkgver}/"

	make
}

package() {
	cd "${pkgname}-${pkgver}/"

	install -D -m0755 afio "${pkgdir}/usr/bin/afio"

	install -D -m0644 afio.1 "${pkgdir}/usr/share/man/man1/afio.1"

	# installing LICENSE
	# note that there is some discussion[1] about the state of this LICENSE
	# [1] https://bugzilla.redhat.com/show_bug.cgi?id=449037
	install -D -m0644 "${srcdir}/"LICENSE "${pkgdir}/"usr/share/licenses/${pkgname}/LICENSE
}

