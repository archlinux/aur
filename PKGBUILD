# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Lukas1818 aur at lukas1818 dot de

pkgname=python-praktikum
_name=${pkgname#python-}
pkgver=2.6.0
pkgrel=1
pkgdesc="Tools for the beginners' lab courses in physics at RWTH Aachen University"
arch=('any')
url="https://pgp.physik.rwth-aachen.de/software/"
license=('MIT')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-uncertainties')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('6431d3b128de906305a6ff2d4a65f3d71011845418c39a0cf91117e76a6d4c31a9f3bad692cb6c48a63957527171b65460ba86fc7a3b9d15460afb1583b493e7')


build() {
	cd "$srcdir/$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
