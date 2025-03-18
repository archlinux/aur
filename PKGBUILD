# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-coq-jupyter
_name=coq_jupyter
pkgver=1.6.2
pkgrel=2
pkgdesc="Coq kernel for Jupyter"
arch=('any')
url="https://github.com/EugeneLoy/coq_jupyter"
license=('Apache-2.0')
makedepends=('python-setuptools')
depends=('coq' 'python-jupyter-client' 'python-future')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	python $_name/install.py --prefix="$pkgdir/usr"
}
sha256sums=('6660ff1a7cfb5c688a2fc60ad159a4d0948ecaaa2388dab7cdb39be8ec58481b')
