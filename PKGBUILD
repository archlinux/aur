# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl
pkgver=2025.5.8
pkgrel=1
pkgdesc='Command-line tool to download .puz files for online crossword puzzles'
arch=(any)
url='https://github.com/thisisparker/xword-dl'
license=(MIT)
depends=(
	python-beautifulsoup4
	python-dateparser
	python-emoji
	python-html2text
	python-lxml
	python-puzpy
	python-requests
	python-unidecode
	python-xmltodict
	python-yaml
)
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf4aa6be29a306d6cdf55687b9d360e5b297a4d60e9ffc913a54dc70521b22a4')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
