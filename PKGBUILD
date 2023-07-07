# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl
pkgver=2023.7.2
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
b2sums=('ba7ff10a81243ca1c16df1e2ef13c5730f20d7e03f71d89ed56ac070e6fc895e55b4a3ed5c57997cffdd59b2823f9de25f58c5f49bbd62704edf266db8f9aa5e')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
