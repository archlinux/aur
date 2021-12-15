# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-click-man
_pyname="${pkgname#python-}"
pkgver=0.4.1
pkgrel=2
pkgdesc='Automate generation of man pages for python click applications'
arch=(any)
url="https://pypi.python.org/pypi/$_pyname"
license=(MIT)
depends=(python
         python-click)
makedepends=(python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('d255c14ecee52afa915228f7dc87603ddb571c3d7d1a2eb219244e440fa88bbb')

build() {
    cd "$_archive"
    python setup.py build
}

package() {
    cd "$_archive"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
