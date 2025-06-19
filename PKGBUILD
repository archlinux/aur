# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Lukas1818 aur at lukas1818 dot de

pkgname=python-praktikum
_name=${pkgname#python-}
pkgver=2.7.1
pkgrel=1
pkgdesc="Tools for the beginners' lab courses in physics at RWTH Aachen University"
arch=('any')
url="https://pypi.org/project/praktikum/"
license=('MIT')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-uncertainties')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('7d48f0bb51f30c6863409ae053f002028ce206033ac1433ecc2c1d5c7d67329192489080a141caf097824886f8b84943522382161c3d765c29b46717f578d8e8')


build() {
	cd "$srcdir/$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
