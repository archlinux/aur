# Maintainer: Jon Schlipf <jschlipf@gmx.com>
pkgname=python-gdsfactory
_origpkgname=gdsfactory
pkgver=9.29.1
pkgrel=1
pkgdesc="python library to generate GDS layouts"
arch=("x86_64")
url='https://pypi.org/project/gdsfactory/'
license=("None")
depends=(
	"python-toolz"
	"python-kfactory"
	"python-aenum"
	"python-networkx"
	"python-graphviz"
	"python-trimesh"
	"python-orjson"
	"python-shapely"
  )
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/f9/cc/264550ed7effdf8411de782a155179c7eef9de57bdb547fed86ef717a78d/gdsfactory-9.29.1.tar.gz")
sha256sums=("6806c8551c0fe086f95fa8c3c02c98691e96a894d5e58d6548b93ef06a7f6786")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
