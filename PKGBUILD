# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Shane Donohoe <shane@donohoe.cc>

pkgname=python-iterfzf
_pkgver=0.5.0.20.0
pkgver=0.5
pkgrel=1
epoch=1
pkgdesc="Pythonic interface to fzf"
arch=('any')
url="https://github.com/dahlia/iterfzf"
license=('GPL3')
depends=('python-setuptools' 'fzf')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/iterfzf/iterfzf-$_pkgver.tar.gz")
sha256sums=('2b6f04d87a7cba79d03c2bb83575bb4580f47502dc024a24fc5dc8c0cfbcc52f')

build() {
	cd "iterfzf-$_pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "iterfzf-$_pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
