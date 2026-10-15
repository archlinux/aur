# Maintainer: Jon Schlipf <jschlipf@gmx.com>
pkgname=python-kfnetlist
_origpkgname=kfnetlist
pkgver=0.2.2
pkgrel=1
pkgdesc="Rust-backed netlist schema and extraction tools for KFactory"
arch=('x86_64')
url="https://github.com/gdsfactory/kfnetlist"
license=('Apache-2.0')

depends=(
)

makedepends=(
    "python-build"
    "python-installer"
    "python-wheel"
    "python-setuptools"
    "python-hatchling"
    "python-maturin"
)

source=("https://files.pythonhosted.org/packages/d2/80/6c1ec7ba4160c61ffaf710943fc25cc1b096ebe50233edf20f8258fd5a8d/kfnetlist-0.2.2.tar.gz")
sha256sums=('9ae38fc262867daa9d06cbda3efff3f1c00504227480d4ab92c379bf0d13b84e')
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
