# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=exif
pkgname=python-$_pipname
pkgver=1.2.2
pkgrel=1
pkgdesc='Read and modify image EXIF metadata'
arch=('any')
url="https://gitlab.com/TNThieding/$_pipname"
license=('MIT')
_py_deps=('plum')
depends=('python'
         "${_py_deps[@]/#/python-}")
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('53d3d491dc7dc587ac636e72b00ffd724e4b07d24c8db7d9a1a1557d992edb96')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
