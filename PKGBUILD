# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-kiutils
_name=${pkgname#python-}
pkgver=1.4.7
pkgrel=1
pkgdesc="Simple and SCM-friendly KiCad file parser based on Python dataclasses"
url="https://github.com/mvnmgrx/kiutils"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1712ba00de681db0bc735b4dda0e98c172e5aac4688eb3e89a8cedd8722ce0af')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
