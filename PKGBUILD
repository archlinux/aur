# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-cursor
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=1
pkgdesc="Python package to hide or show the terminal cursor"
arch=('any')
url="https://github.com/GijsTimmers/${_name}"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7e728934f555a84a1c8b0850b66efcb580d092acc927b7d15dd43eb27dd4c4c5')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
