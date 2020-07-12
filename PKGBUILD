# Maintainer: Mikael Blomstrand <gmail: kmbloms>
# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Paul B <paul2lv@gmail.com>

pkgname=fahviewer
pkgver=7.6.13
pkgrel=2
pkgdesc='Folding@home 3D Simulation Viewer'
url='https://foldingathome.org'
arch=(x86_64)
license=(GPL2)
depends=(glu glut)
source=(https://download.foldingathome.org/releases/public/release/"${pkgname}"/debian-stable-64bit/v"${pkgver%.*}"/"${pkgname}"_"${pkgver}"-64bit-release.tar.bz2)
sha1sums=('faa54139a7224b9dde1e6d45bf7714a47088b621')
sha256sums=('4fb257574f130bf301e99fb4f1bce812a32f53bb83bced8bb206b61bf33a460d')
sha512sums=('87655d2024d52b661d1e9596f423b30904e7175bb8686ff9a4c343584db44a8f026fcee1328a2580a342417e990fb25272161eda1fbe3be2377abba3c4aca6a0')

package() {
	install -dm755 "${pkgdir}"/opt/fah/
	cp -r "${pkgname}"_"${pkgver}"-64bit-release/backgrounds "${pkgdir}"/opt/fah/

	install -d "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}"/fahviewer_"${pkgver}"-64bit-release/FAHViewer -t "${pkgdir}"/opt/fah
	ln -s /opt/fah/FAHViewer "${pkgdir}"/usr/bin/FAHViewer
}


