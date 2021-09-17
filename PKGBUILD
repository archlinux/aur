# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Co-Maintainer: Saulius Lukauskas < luksaulius @ gmail . com >
# Contributor: Decrypted Epsilon <decrypted.epsilon (at) gmail (dot) com>

pkgname=flexbar
pkgver=3.5.0
pkgrel=1
pkgdesc="flexible barcode and adapter removal for sequencing platforms"
arch=("any")
url="https://github.com/seqan/flexbar/"
license=('GPL3')
depends=('seqan' 'cmake')
source=("https://github.com/seqan/flexbar/archive/v${pkgver}.tar.gz")
md5sums=('0e07bf4afebfd731c4718b401383224a')

build() {
        cd ${pkgname}-${pkgver}
        cmake src
        make
}

package() {
        install -d ${pkgdir}/usr/bin
        install -Dm755 ${srcdir}/${pkgname}-${pkgver}/flexbar ${pkgdir}/usr/bin
}
