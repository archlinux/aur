# Maintainer: Jordan Christiansen <xordspar0@gmail.com>

pkgname=ninekey
pkgver=0.1
pkgrel=1
pkgdesc="A barebones hotkey/launcher application"
arch=('any')
url="https://github.com/xordspar0/${pkgname}"
license=('MIT')
depends=('python' 'python-pyqt4')
source=("https://github.com/xordspar0/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('dcc8b4f63bbaa9af444dddb960b24e57f3a91e0d6620d8fad8e9d89a16fe6c0e')

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
