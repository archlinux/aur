# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=kodi-nfo-generator
_pkgname=${pkgname//-/_}
pkgver=0.0.17
pkgrel=1
pkgdesc=" Simple Python-based command-line tool to generate .nfo files for movies and TV series used by Kodi."
arch=('any')
url="https://github.com/fracpete/kodi-nfo-generator"
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'python-beautifulsoup4')
source=("https://github.com/fracpete/${pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1f3322f63d3124a37caa047db84c7a33e5a875133b9e323dec37a1e74b991836')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

