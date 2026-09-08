# Maintainer: Jon Schlipf <jschlipf@gmx.com>
pkgname=python-kfactory
_origpkgname=kfactory
pkgver=3.0.4
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
	"python-rectangle-packer"
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
source=("https://files.pythonhosted.org/packages/6f/eb/d1407de9be7152e16d604ee98d468f08612374bd35ea524064f2caeb051c/kfactory-3.0.4.tar.gz")
sha256sums=('40aab620d93cd389c74e76a96980aa4914249422ad1817b20b747abed65f566b')
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
