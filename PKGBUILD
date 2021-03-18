# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=etcd3
pkgname=python-$_pyname
pkgver=0.12.0
pkgrel=1
pkgdesc="Python client for the etcd3 API"
arch=('any')
url="https://github.com/kragniz/python-etcd3"
license=('Apache')
depends=(
	python
	python-grpcio
	python-protobuf
	python-six
	python-tenacity
)
makedepends=(python-setuptools)
checkdepends=(
	python-pytest
	bump2version
	python-coverage
	python-flake8-docstrings
	python-flake8-import-order
	flake8
	python-grpcio-tools
	python-hypothesis
	python-mock
	python-more-itertools
	python-pifpaf
	python-pydocstyle
	python-pytest-cov
	python-pytest
	python-pyaml
	python-sphinx
	python-tox
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('f40a94e5e93194a9591a20bd600f4c84')
sha256sums=('89a704cb389bf0a010a1fa050ce19342d23bf6371ebda1c21cfe8ff3ed488726')
sha512sums=('d31cf0059036af91b489d6197fcda71314b5dcd068b6095212e1fec39d55b0bc4e943da3fdda6131fd1a6d48741334f5659e470c3284f0c6ab1a39d662d7d78a')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
