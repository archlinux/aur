# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-cursor
_name=${pkgname#python-}
pkgver=1.3.5
pkgrel=1
pkgdesc="Python package to hide or show the terminal cursor"
arch=('any')
url="https://github.com/GijsTimmers/${_name}"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6758cae6ac14765ec85d9ce3f14fcb98fff5045f06d8398f1e8da8ce3acd2f20')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
