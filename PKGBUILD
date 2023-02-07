# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl
pkgver=2023.1.31
pkgrel=1
pkgdesc='Command-line tool to download .puz files for online crossword puzzles'
arch=(any)
url='https://github.com/thisisparker/xword-dl'
license=(MIT)
depends=(
	python-argparse
	python-beautifulsoup4
	python-dateparser
	python-html2text
	python-puzpy
	python-requests
	python-unidecode
	python-xmltodict
	python-yaml
)
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0f1d03ced8c8b9d3074f5652292f6cfeaf60e1f0d0c809856d47db3c71a8413280a54a142c4d17c917459d51618288ed50b6c16ac457a7b2bacc119297d552b7')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
