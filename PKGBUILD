# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-jenkspy
_pkgname=jenkspy
pkgver=0.2.0
pkgrel=1
pkgdesc='Compute Natural Breaks in Python (Fisher-Jenks algorithm) '
arch=('any')
url='https://github.com/mthh/jenkspy'
license=('MIT')
depends=('python-numpy' 'python')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/mthh/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9ce97ac3d8beaf06743e85c4fb04a5b1481f68e3efa601da2c4ff19c7bea3e2d734618eb34e3f775eea2c76807e2405361ded1e73d5cfcef91c112f34c437b7e')

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

