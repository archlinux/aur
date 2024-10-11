# Maintainer: Anthony Wang <ta180m@pm.me>
# Contributor: Tommy Li <ttoo74@gmail.com>

pkgname=python-certipy
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple python tool for creating certificate authorities and certificates on the fly"
arch=(any)
url="https://github.com/LLNL/certipy"
license=('BSD')
depends=(python python-cryptography)
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
checkdepends=()
optdepends=()
options=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0c0ea7b25248b42fb930f30173a78c029e6ba67e2ef9598ca4470d8975c9cbb6')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

