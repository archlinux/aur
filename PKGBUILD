pkgname='python3-colcon-mixin'
pkgdesc='fetch and manage CLI mixins from repositories'
pkgver='0.2.3'
pkgrel=2
arch=('any')
url='https://pypi.org/project/colcon-mixin/'
license=('Apache-2.0')
depends=('python>=3.6' 'python-colcon-core')
makedepends=('python-setuptools')
source=('https://files.pythonhosted.org/packages/ea/8c/fc63ad7fe97ec564a6b12680ae123b13911608b059d0c2b05c79a22a4bb2/colcon-mixin-0.2.3.tar.gz')
sha512sums=('8018059fe3f96507e2f503ecc665ef7737f49b2f67c6b6246080cd5409806683716c2ffdbd7c4167e2e57d9d428f06b9f86ed64bb45b9beb5f9c96c3dda084b6')

build() {
	cd "colcon-mixin-$pkgver/"
	python setup.py build
}

package() {
	cd "colcon-mixin-$pkgver/"
	python setup.py install --root="$pkgdir" --optimize=1
}
