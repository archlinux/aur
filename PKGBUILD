# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl
pkgver=2023.12.2
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
b2sums=('cad17f79bca307b469fd89fd9d21f062dbd1e7e9f176afedaa0563fc70936fd65b4c59d9425953937e4ca08d12a7f480b0b3eb3e580f804b2980692369b2135f')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
