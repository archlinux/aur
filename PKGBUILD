# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
# Contributor: Christopher Billington <chrisjbillington@gmail.com>
pkgname=python-pykat
_name=PyKat
pkgver=1.2.2
pkgrel=1
pkgdesc="Python interface and tools for FINESSE"
license=("GPL2")
url="https://pypi.org/project/PyKat/"
makedepends=('python-setuptools')
depends=('finesse')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f2dc912aee7ae7b1f3a193fe1dfd155c6ff8527b0e7e3a1d649d090c63a7472c')
arch=('any')

build() {
	cd $srcdir/${_name}-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/${_name}-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
}
