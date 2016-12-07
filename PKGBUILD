# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=ssllabs-scan
pkgver=1.4.0
pkgrel=1
pkgdesc='Command-line client for the SSL Labs APIs'
arch=('x86_64' 'i686')
url='https://github.com/ssllabs/ssllabs-scan'
license=('apache')
depends=("gcc-go")
source=("https://github.com/ssllabs/ssllabs-scan/archive/v${pkgver}.tar.gz")
sha256sums=('a7d5fad92649172ca4b190f481172b602aa1ae103d14dd1f1951ee250d382eec')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	gccgo -o ssllabs-scan ssllabs-scan.go
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# binary
	install -Dm755 ssllabs-scan ${pkgdir}/usr/bin/ssllabs-scan

	# docs
	install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
	cp *.md *.sql ${pkgdir}/usr/share/doc/${pkgname}
}
