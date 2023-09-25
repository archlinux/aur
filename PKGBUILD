# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=kodi-nfo-generator
pkgver=0.0.13
pkgrel=1
pkgdesc=" Simple Python-based command-line tool to generate .nfo files for movies and TV series used by Kodi."
arch=('any')
url="https://github.com/fracpete/kodi-nfo-generator"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/fracpete/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e3b7665d5fca658cbc411ccfc07b91053b351dd457bc82af61b1b73a05213c36')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

