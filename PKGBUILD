# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl
pkgver=2023.4.3
pkgrel=1
pkgdesc='Command-line tool to download .puz files for online crossword puzzles'
arch=(any)
url='https://github.com/thisisparker/xword-dl'
license=(MIT)
depends=(
	python-beautifulsoup4
	python-dateparser
	python-html2text
	python-importlib-metadata
	python-lxml
	python-puzpy
	python-requests
	python-unidecode
	python-xmltodict
	python-yaml
)
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ca47a5b697ce9e178702d0734f72b6ea8571c5c34137c0af2b11ba3b2bd3eb4176166e77928f24840a50a52555fe292823c18b34716464f118be905bfe412b3f')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
