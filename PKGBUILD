# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=kodi-nfo-generator
_pkgname=${pkgname//-/_}
pkgver=0.1.1
pkgrel=1
pkgdesc=" Simple Python-based command-line tool to generate .nfo files for movies and TV series used by Kodi."
arch=('any')
url="https://github.com/fracpete/kodi-nfo-generator"
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'python-beautifulsoup4')
source=("https://github.com/fracpete/${pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0052bbf76a78b5eb414e4413b1f6db24a77e7fabc0d72ff74b9ec9a350a0db20')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

