# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=sphinxcontrib-actdiag
pkgname=python-$_pyname
pkgver=3.0.0
pkgrel=1
pkgdesc="Sphinx actdiag extension"
arch=('any')
url="https://github.com/blockdiag/sphinxcontrib-actdiag"
license=(BSD)
depends=(
	python
	actdiag
	blockdiag
	python-sphinx
)
makedepends=(
	python
	python-setuptools
)
source=("https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('4171faa43dbf5394052319f0992539eb')
sha256sums=('3c55d454ffc3b9efe7c20f2adaf022199b825612d32f200be8a497aa87e0f81f')
sha512sums=('b6cb595c2f5a6ac5c816b7b8424239c8ce1787420776f6e001721818d64d546f97d03baacef636464fb29a4f7a62d6f89dec7894b942e87d2b07d78edecc7ecd')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
