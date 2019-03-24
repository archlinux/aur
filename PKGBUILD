# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=ssllabs-scan
pkgver=1.5.0
pkgrel=1
pkgdesc='Command-line client for the SSL Labs APIs'
arch=('x86_64' 'i686')
url='https://github.com/ssllabs/ssllabs-scan'
license=('Apache')
depends=("glibc")
makedepends=("go")
source=("https://github.com/ssllabs/ssllabs-scan/archive/v${pkgver}.tar.gz")
sha256sums=('51c52e958d5da739910e9271a3abf4902892b91acb840ea74f5c052a71e3a008')

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	make
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	# binary
	install -Dm755 ssllabs-scan-v3 "${pkgdir}"/usr/bin/ssllabs-scan

	# docs
	install -dm755 "${pkgdir}"/usr/share/doc/${pkgname}
	cp *.md *.sql "${pkgdir}"/usr/share/doc/${pkgname}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
