# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Lukas1818 aur at lukas1818 dot de

pkgname=python-praktikum
_name=${pkgname#python-}
pkgver=2.7.0
pkgrel=1
pkgdesc="Tools for the beginners' lab courses in physics at RWTH Aachen University"
arch=('any')
url="https://pypi.org/project/praktikum/"
license=('MIT')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-uncertainties')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('3eef43146dd2e4539191a267469960a8aa61913052d367afc25a67c9f3c7a484fce767b43f61cd49c1bc359eb3c544f0c9a88ad416ec09adf07e0408c2362624')


build() {
	cd "$srcdir/$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
