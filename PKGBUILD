# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-openai
_pkgname=openai
pkgver=0.10.2
pkgrel=1
pkgdesc='convenient access to the OpenAI API from applications written in the Python language.'
arch=('any')
url='https://openai.com/'
license=('MIT')
depends=('python' 'python-requests' 'python-tqdm')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/openai/${_pkgname}-python/archive/v${pkgver}.tar.gz")
sha512sums=('189a4f1719b432eab0a86696a52d44002626563aa023cdd619b62e61b985f21252ce529657e6498c0c4695d3839404a4154a02487b53187f4ae75609bc237443')

build()
{
  	cd "$srcdir/${_pkgname}-python-$pkgver"
  	python setup.py build
}


package()
{
  	cd "$srcdir/${_pkgname}-python-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
    # install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

