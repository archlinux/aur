# Contributor: Lukas1818 aur at lukas1818 dot de

pkgname=python-praktikum
_name=${pkgname#python-}
pkgver=2.5.1
pkgrel=1
pkgdesc="Tools for the beginners' lab courses in physics at RWTH Aachen University"
arch=('any')
url="https://pgp.physik.rwth-aachen.de/software/"
license=('MIT')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-uncertainties')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('2365afb679b57e693ea9e86d3b97225b84949a05091281374016f2f6f3c336f2276364d27a39b96b3517dc743c2aa88984ca4fc8a9c7b0cee002e718f99b3980')


build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
