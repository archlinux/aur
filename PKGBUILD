# Maintainer: Decrypted Epsilon <decrypted.epsilon (at) gmail (dot) com>

pkgname=flexbar
pkgver=2.5
pkgrel=1
pkgdesc="flexible barcode and adapter removal for sequencing platforms"
arch=("any")
url="http://sourceforge.net/projects/flexbar"
license=('GPL3')
depends=('seqan' 'cmake')
source=("http://downloads.sourceforge.net/project/flexbar/2.5/${pkgname}_v${pkgver}_src.tgz")
sha512sums=('4ffd5444c2dc1de3dcd33bcd674376c007bd6bc2acfc94ff25fbd73ea6aabc963d4344f51f4a597b59b4965711a68f7900efcead1229ba9c2d3659c5b55c9a30')

build() {
		cd ${pkgname}_v${pkgver}_src
		cmake src
		make
}

package() {
		install -d ${pkgdir}/usr/bin
		install -Dm755 ${srcdir}/${pkgname}_v${pkgver}_src/flexbar ${pkgdir}/usr/bin
}
