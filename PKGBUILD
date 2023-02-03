# Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=jenkspy
pkgname=python-$_pkgname
pkgver=0.3.2
pkgrel=1
pkgdesc='Compute Natural Breaks in Python (Fisher-Jenks algorithm) '
arch=('any')
url='https://github.com/mthh/jenkspy'
license=('MIT')
depends=('python-numpy')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/mthh/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7073cb892ce47396ad024528c584a72e6709f5bf77901e7b065da25b8a965ffe3bd7d3ae649008a7d32aa16395e64e860cd82db7c67078c4f31170bb81b20927')

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

