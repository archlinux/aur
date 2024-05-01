# Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=jenkspy
pkgname=python-$_pkgname
pkgver=0.4.0
pkgrel=1
pkgdesc='Compute Natural Breaks in Python (Fisher-Jenks algorithm) '
arch=('any')
url='https://github.com/mthh/jenkspy'
license=('MIT')
depends=('python-numpy')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/mthh/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6b0f9a56cc9efb00d91d2c3499b6784bc8600b89d48d0774c7e11d744f63810327e583d313f398809e03b6078c2d37a511ff3836ff94a20c88a65063d47550e0')

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

