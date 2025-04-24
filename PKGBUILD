# Contributor: Scott Alfter <scott@alfter.us>

_pkgname=kicad-skip
pkgname="python-$_pkgname"
pkgver=0.2.5
pkgrel=1
pkgdesc="S-expression KiCad file Python parser"
arch=(any)
url=https://github.com/psychogenic/${_pkgname}
license=("LGPL-2.1")
depends=("python" "python-sexpdata")
makedepends=("python-build" "python-installer")
source=(
	"https://github.com/psychogenic/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	)
sha512sums=(
	"93086c568e4c0bb8b639bcdede0f29f6912d0c725ad6a25d890221ebb2c3945400b302c6b639d6af4ea840779b832771c9129bfedc3772212ed94244740059d3"
	)

build() 
{
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() 
{
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
