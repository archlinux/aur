# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-coq-jupyter
_name=coq_jupyter
pkgver=1.6.0
pkgrel=2
pkgdesc="Coq kernel for Jupyter"
arch=('any')
url="https://github.com/EugeneLoy/coq_jupyter"
license=('Apache')
makedepends=('python-setuptools')
depends=('coq' 'python-future' 'python-jupyter-client')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ee3c43b8852a65b4a774f39304f5e5ac8bb49ff4b9541035e20de49bae647f2c')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
	python $_name/install.py --prefix="$pkgdir/usr"
}