# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=python-praktikum
_name=${pkgname#python-}
pkgver=2.4.0
pkgrel=1
pkgdesc="Tools for the beginners' lab courses in physics at RWTH Aachen University"
arch=('any')
url="https://pgp.physik.rwth-aachen.de/software/"
license=('MIT')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-future' 'python-uncertainties')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('3c1f28df54dc6c40bff7d2c12c9d807d240f62a7e336390ad85b4c6941c92272ea0796947562634c25f4eac68f0689248bf9ffc6bda475679abeea2fcb64d428')


build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
