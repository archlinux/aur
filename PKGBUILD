# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=kodi-nfo-generator
pkgver=0.0.9
pkgrel=1
pkgdesc=" Simple Python-based command-line tool to generate .nfo files for movies and TV series used by Kodi."
arch=('any')
url="https://github.com/fracpete/kodi-nfo-generator"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/fracpete/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('10f1ff6f570ed07b39d038e08ad07ea79f59c54cd7f3924fb8a17f6991cf7ab0')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

