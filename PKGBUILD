# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-openai
_pkgname=openai
pkgver=0.22.0
pkgrel=1
pkgdesc='convenient access to the OpenAI API from applications written in the Python language.'
arch=('any')
url='https://openai.com/'
license=('MIT')
depends=('python' 'python-requests' 'python-tqdm' 'python-pandas' 'python-openpyxl' 'python-pandas-stubs')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/openai/${_pkgname}-python/archive/v${pkgver}.tar.gz")
sha512sums=('25066b608c4c4f84b0c0d3cde358ca6feb2f73fd0b027235929744068db02761a8c71ca725b4720d7e85359a82fadea83bf65a6c79107aecc38c390d487c5e0e')

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

