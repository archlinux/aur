# Maintainer: Jordan Christiansen <xordspar0@gmail.com>

pkgname=ninekey
pkgver=0.2
pkgrel=2
pkgdesc="A barebones hotkey/launcher application"
arch=('any')
url="https://github.com/xordspar0/${pkgname}"
license=('GPL')
depends=('python' 'python-pyqt5')
source=("https://github.com/xordspar0/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1215d962a70f01cfc0f3f83b61d08657bbd6c3e0c1774e519ccdf6158a59268c')

package() {
	cd ${pkgname}-${pkgver}

	mkdir -p "${pkgdir}"/usr/bin
	install -D -m755 ./"${pkgname}".py "${pkgdir}"/usr/bin/"${pkgname}"
	mkdir -p "${pkgdir}"/usr/share/applications
	install -D -m644 ./"${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
	mkdir -p "${pkgdir}"/usr/share/pixmaps
	install -D -m644 ./"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/"${pkgname}".png
	mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
	install -D -m644 ./LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
