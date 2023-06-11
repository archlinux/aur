# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
# Contributor: Christopher Billington <chrisjbillington@gmail.com>
pkgname=python-pykat
_name=pykat
pkgver=1.2.94
pkgrel=1
pkgdesc="Python interface and tools for FINESSE"
license=("GPL2")
url="https://www.gwoptics.org/pykat/"
depends=('finesse' 'python-numpy' 'python-scipy' 'python-six' 'python-h5py-git' 'python-pandas' 'python-matplotlib' 'python-tabulate' 'python-click')
source=("git+https://git.ligo.org/finesse/$_name")
sha256sums=('SKIP')
arch=('any')

build() {
	cd $srcdir/${_name}
	python setup.py build
}

package() {
	cd $srcdir/${_name}
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
}
	
