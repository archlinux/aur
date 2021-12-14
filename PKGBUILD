# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: William Turner <willtur.will@gmail.com>

pkgname=python-mutatormath
_pkgname=MutatorMath
pkgver=3.0.1
pkgrel=2
pkgdesc='Piecewise linear interpolation of multiple, arbitrarily placed, masters'
arch=(any)
url='https://github.com/LettError/MutatorMath'
license=(BSD)
depends=(python
         python-defcon
         python-fontmath
         python-fonttools)
makedepends=(python-setuptools)
_archive="$_pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.zip")
sha256sums=('8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
