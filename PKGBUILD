# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-openai
_pkgname=openai
pkgver=0.11.1
pkgrel=1
pkgdesc='convenient access to the OpenAI API from applications written in the Python language.'
arch=('any')
url='https://openai.com/'
license=('MIT')
depends=('python' 'python-requests' 'python-tqdm')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/openai/${_pkgname}-python/archive/v${pkgver}.tar.gz")
sha512sums=('3ff446e1fbfb03e7c6cd9cd709e58f968dcc144fcb8316e6fc35c0825247c3a0fa9049bca07341f162c8d5368094b6e38028cf4bd10767c09ffe2b024bfdf56b')

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

