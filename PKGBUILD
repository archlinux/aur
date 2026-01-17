# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=kodi-nfo-generator
_pkgname=${pkgname//-/_}
pkgver=0.0.19
pkgrel=1
pkgdesc=" Simple Python-based command-line tool to generate .nfo files for movies and TV series used by Kodi."
arch=('any')
url="https://github.com/fracpete/kodi-nfo-generator"
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'python-beautifulsoup4')
source=("https://github.com/fracpete/${pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('af0c06e2ee6cd460e2305e398fd480f67ae9727bab38eadde446e31f2d8e193a')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

