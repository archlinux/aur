# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Will Price <will.price94+aur@gmail.com>
pkgname=antlrworks
pkgver=2.1
pkgrel=3
pkgdesc="A netbeans-based grammar IDE for ANTLR"
arch=('x86_64' 'i686')
url="http://tunnelvisionlabs.com/products/demo/antlrworks"
license=('GPL')
depends=('jre8-openjdk')
makedepends=()
options=(!strip libtool staticlibs)
source=(
	"http://tunnelvisionlabs.com/downloads/antlr/2013-07-21-${pkgname}-${pkgver}.zip"
	"antlrworks"
	)
sha256sums=(
	"87cb71e0ad84da4f4642c12995a028be63c7f1179e38d551a47090c8c3bab988"
	"403296a4ea478709308212bb3cd4945689a62ef31738ea230c921b57cce31253"
	)

package() {
	cd "${srcdir}/${pkgname}${pkgver%%.*}"
	chmod +x bin/antlrworks2
	mkdir -p "${pkgdir}/"{etc,usr/{share/antlrworks,bin}}
	cp -r * "${pkgdir}/usr/share/antlrworks"
	#mv "${pkgdir}/usr/share/antlrworks/etc" "${pkgdir}/"
	cd "${pkgdir}/usr/bin"
	install -Dm 755 "${srcdir}/antlrworks" .
}
