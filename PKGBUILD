# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-kiutils
_name=${pkgname#python-}
pkgver=1.4.8
pkgrel=2
pkgdesc="Simple and SCM-friendly KiCad file parser based on Python dataclasses"
url="https://github.com/mvnmgrx/kiutils"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('18c5803283e579cfe8772955e7702548d7139e0fc630daa579ed6b2b767db846')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
