# Maintainer: Jon Schlipf <jschlipf@gmx.com>
pkgname=python-kfactory
_origpkgname=kfactory
pkgver=2.2.0
pkgrel=1
pkgdesc="KLayout API implementation of gdsfactory"
arch=("x86_64")
url='https://pypi.org/project/kfactory/'
license=("None")
depends=(
	"python-gitpython"
	"klayout"
	"python-dotenv"
	"python-aenum"
	"python-aenum"
	"python-cachetools"
	"python-pydantic-settings"
	"python-loguru"
	"python-rectangle-packer-git"
	"python-pydantic-extra-types"
  )
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/0c/f5/c537a38158e3accaf43552cf1fc1a14f88174fc6013a7bbc8dc3685c3c99/kfactory-2.2.0.tar.gz")
sha256sums=("8cf283ee9e25e46fa1b04e72072d06a219934cc2b3f0c3e381f32e800d0134dc")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
