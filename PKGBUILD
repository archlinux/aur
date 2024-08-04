# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl
pkgver=2024.7.20
pkgrel=2
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
b2sums=('40a0cdafb499705e69d0e8ee85b3ab5ef8f2541e58434c8223844647e85c62be46a64690f0236e65bef2fa45c2364bc6fc1a0f31445de9e509a41234ac890d01')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
