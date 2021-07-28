# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
# Contributor: Christopher Billington <chrisjbillington@gmail.com>
pkgname=python-pykat
_name=PyKat
pkgver=1.2.81
pkgrel=1
pkgdesc="Python interface and tools for FINESSE"
license=("GPL2")
url="https://pypi.org/project/PyKat/"
makedepends=('python-setuptools')
depends=('finesse')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6721071a852ac96603cb6afd4c79e25a1993b022580ff41dcb92c0b2eacf9f70')
arch=('any')

build() {
	cd $srcdir/${_name}-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/${_name}-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
}
