# Maintainer: dragon <drgn@fn.de>

pkgname=upsies
pkgver=2026.08.09
pkgrel=1
pkgdesc='Media metadata aggregator'
arch=('any')
url="https://codeberg.org/plotski/upsies"
license=('GPL-3.0-only')
depends=(
	python
	python-aiobtclientapi
	python-async-lru
	python-beautifulsoup4
	python-countryguess
	python-guessit
	python-httpx
	python-langcodes
	python-natsort
	python-packaging
	python-prompt_toolkit
	python-pydantic
	python-pyimgbox
	python-pyparsebluray
	python-pyxdg
	python-term-image
	python-torf
	python-unidecode
	mediainfo
	oxipng
)
makedepends=(git python-{build,installer,wheel,setuptools})
source=("git+$url#tag=v$pkgver")
sha512sums=('8a8641b163a19c80746468a3900b5fad2cae0249581139f9dc367becf9b17a9980baafe2c7a5efd25300ff9dc0029d3c9572cc8a9a4de779bb39f91403c8a491')


build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}
