# Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=jenkspy
pkgname=python-$_pkgname
pkgver=0.3.3
pkgrel=1
pkgdesc='Compute Natural Breaks in Python (Fisher-Jenks algorithm) '
arch=('any')
url='https://github.com/mthh/jenkspy'
license=('MIT')
depends=('python-numpy')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/mthh/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('25713acb9907f2094f79236033298c30e5c8ec0f16406c5ea93ce15e738695a240c4f286d7af9b63147f12ba620120d40eaaa62882b2aa23784646b169a2f450')

build()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
  	python setup.py build
}


package()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
    # install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

