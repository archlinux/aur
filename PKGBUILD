# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pytest-factoryboy
pkgver=2.1.0
pkgrel=1
pkgdesc="factory_boy integration with pytest-runner"
arch=('any')
url="https://github.com/pytest-dev/pytest-factoryboy"
license=('MIT')
groups=()
depends=('python-factoryboy>=2.10.0'
         'python>=3.6'
         'python-inflection'
         'python-pytest>=4.6')
makedepends=('python-setuptools')
# checkdepends=()
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pytest-factoryboy/pytest-factoryboy-$pkgver.tar.gz")
sha256sums=('23bc562ab32cc39eddfbbbf70e618a1b30e834a4cfa451c4bedc36216f0a7b19')

build() {
	cd "pytest-factoryboy-$pkgver"
	python setup.py build
}

package() {
	cd "pytest-factoryboy-$pkgver"
	python setup.py install --root "$pkgdir/" --optimize=1 --skip-build
}
