# Contributor: Vojtech Horky <AUR / hotspur> 
pkgname=csvfix
pkgver=1.5
pkgrel=2
pkgdesc="Command-line stream editor designed to deal with CSV data"
url="http://code.google.com/p/csvfix/"
arch=('i686' 'x86_64')
license=('custom')
depends=('gcc-libs')
# Downloading from here because on code.google.com is not ZIP version
# with sources (also notice the directory we cd-into)
source=("https://bitbucket.org/neilb/${pkgname}/get/version-${pkgver}.zip")
md5sums=('ae7e0a41e3bca3f48f08fbca60602d4c')

build() {
	cd "${srcdir}/neilb-csvfix-8ae6bdb5996e/"
	make lin
}

package() {
	cd "${srcdir}/neilb-csvfix-8ae6bdb5996e/"
	install -D -m 0755 "${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

