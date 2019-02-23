# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-cursor
_name=${pkgname#python-}
pkgver=1.3.2
pkgrel=1
pkgdesc="Python package to hide or show the terminal cursor"
arch=('any')
url="https://github.com/GijsTimmers/${_name}"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3566e50c21973ddf03a035b3cb40f2d96228eb8ec4868dde553fc78ae01ccad1')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
