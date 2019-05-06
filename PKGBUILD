# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-xmlschema
_name=${pkgname#python-}
pkgver=1.0.11
pkgrel=1
pkgdesc="An XML Schema validator and decoder"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python' 'python-elementpath')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a4f1f05892173d3f113b599bab96101b24992359fa39b929dc91bb23e8cefe2f')

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
