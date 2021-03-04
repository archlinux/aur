# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=exif
pkgname=python-$_pipname
pkgver=1.2.0
pkgrel=1
pkgdesc='Read and modify image EXIF metadata'
arch=('any')
url="https://gitlab.com/TNThieding/$_pipname"
license=('MIT')
_py_deps=('plum')
depends=('python'
         "${_py_deps[@]/#/python-}")
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('a2dc1928993291ba10932a611a416eacedb72755898344b2827fb0afec68f40b')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
