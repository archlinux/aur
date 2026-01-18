# Maintainer: dragon <drgn@fn.de>

pkgname=upsies
pkgver=2026.01.03
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
sha512sums=('6be837108067b3c6f4f8c19fd1402852f969381b9ae63df3910873e93151a092dd69f1339c988ded4d6ada5b2f016800756d34ff3ef4410fa9a73609dba6b0e5')


build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}
