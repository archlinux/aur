# Contributor: Vojtech Horky <AUR / hotspur> 
pkgname=csvfix
pkgver=1.6
pkgrel=1
pkghashver=e804a794d175
pkgdesc="Command-line stream editor designed to deal with CSV data"
url="http://neilb.bitbucket.org/csvfix/"
arch=('i686' 'x86_64')
license=('custom')
depends=('gcc-libs')
source=("https://bitbucket.org/neilb/${pkgname}/get/version-${pkgver}.zip")
md5sums=('507afcd3fd373182e1de6e5385843f60')

build() {
	cd "${srcdir}/neilb-csvfix-$pkghashver/"
	make lin
}

package() {
	cd "${srcdir}/neilb-csvfix-$pkghashver/"
	install -D -m 0755 "${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
