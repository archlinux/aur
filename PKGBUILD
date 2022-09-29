# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-openai
_pkgname=openai
pkgver=0.23.1
pkgrel=1
pkgdesc='convenient access to the OpenAI API from applications written in the Python language.'
arch=('any')
url='https://openai.com/'
license=('MIT')
depends=('python' 'python-requests' 'python-tqdm' 'python-pandas' 'python-openpyxl' 'python-pandas-stubs')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/openai/${_pkgname}-python/archive/v${pkgver}.tar.gz")
sha512sums=('d59e334a8f583dbbe2543a15804739e7582c80bc7576b79c5b4a8b65ff4f5b7d5a235d4dcfcef84fa0502204028194e6ca18def627cedc107c7989c5678e3994')

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

