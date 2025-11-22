# Maintainer: loadept <loadept3 [at] gmail [dot] com>

pkgname=qtheme
pkgver=3.0.1
pkgrel=1
pkgdesc="Tool for management qtile desktop environment"
url='https://github.com/loadept/qtheme'
arch=('any')
license=('MIT')
depends=('python>=3.12' 'qtile' 'kitty' 'fastfetch')
makedepends=('python-installer')
source=(
	${pkgname}-${pkgver}-py3-none-any.whl::${url}/releases/download/v${pkgver}/qtheme-${pkgver}-py3-none-any.whl
)
sha512sums=('0b9196f5e77d3c3aa0c346688af5b7432820c2244a86047c0139111482f258d93039d1d69598607f42fb7212d4c4702d6b4fa838086cb17ef0858e996920d2d6')

package() {
	python -m installer --destdir="$pkgdir" "${srcdir}/${pkgname}-${pkgver}-py3-none-any.whl"

	install -Dm 644 $pkgdir/usr/lib/python3.*/site-packages/qtheme-${pkgver}.dist-info/licenses/LICENSE \
		"${pkgdir}"/usr/share/licenses/${pkgname}

	install -Dm 644 $pkgdir/usr/lib/python3.*/site-packages/qtheme-${pkgver}.dist-info/METADATA \
		"${pkgdir}"/usr/share/doc/${pkgname}
}
