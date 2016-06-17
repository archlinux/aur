# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='maltego-casefile'
pkgver='2.1.1.8751'
pkgrel=1
pkgdesc='A tool from Paterva to allow data analysts to examine links between data'
arch=('any')
url='http://paterva.com/web7/buy/maltego-clients/casefile.php'
license=('Commercial')
depends=('jre8-openjdk')
source=('http://paterva.com/cf211/MaltegoCaseFile.v2.1.1.8751.deb')
md5sums=('ff46740d7574f368d5d83b81f8fa8edc')

package() {
	cd "${srcdir}"
	tar xf "data.tar.gz"
        install -dm755 "${pkgdir}/usr/share/" && install -dm755 "${pkgdir}/usr/bin/"
        cp -rf usr/share/* "${pkgdir}/usr/share/"
        cp -rf usr/bin/* "${pkgdir}/usr/bin/"
        mkdir "misc"
        tar xf "control.tar.gz" -C "misc"
        cp -rf "misc" "${pkgdir}/usr/share/MaltegoCaseFile/"
}
