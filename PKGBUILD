# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-openai
_pkgname=openai
pkgver=0.13.0
pkgrel=1
pkgdesc='convenient access to the OpenAI API from applications written in the Python language.'
arch=('any')
url='https://openai.com/'
license=('MIT')
depends=('python' 'python-requests' 'python-tqdm')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/openai/${_pkgname}-python/archive/v${pkgver}.tar.gz")
sha512sums=('271307f595521b258b52b1ab2297200fbf4c9e9eeb19d3d0d92b52ccea6455d9beee2ffbcd316ce8f8a17df1f5eba7a64837ee55f9034bb9ebd2d14be059f8ae')

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

