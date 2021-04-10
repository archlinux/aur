# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=exif
pkgname=python-$_pipname
pkgver=1.2.1
pkgrel=1
pkgdesc='Read and modify image EXIF metadata'
arch=('any')
url="https://gitlab.com/TNThieding/$_pipname"
license=('MIT')
_py_deps=('plum')
depends=('python'
         "${_py_deps[@]/#/python-}")
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('b6eaf1c11cd54a177231ff119eb0c1fb19f7a2d0402dd5a2b49dfe3d7fac7abc')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
