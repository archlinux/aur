# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-jupyter-openscad-kernel
_name=${pkgname#python-}
pkgver=1.0.14
pkgrel=2
pkgdesc="Jupyter kernel for OpenSCAD"
arch=('any')
url="https://github.com/EugeneLoy/coq_jupyter"
license=('MIT')
makedepends=('python-setuptools')
depends=('openscad' 'python-jupyter-client' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8be55ba63fefca43f8973674b943b87f2a7bc9c12bb86c9546b0077afb5a179f')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 ./iopenscad/openscad/* -t $pkgdir/usr/share/jupyter/kernels/openscad
}