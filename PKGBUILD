# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=multidict
pkgname=python-${_pkgname}-gns3
pkgver=3.1.3
pkgrel=1
pkgdesc='Asyncio-based multidict implementation for Python (GNS3)'
url='https://github.com/aio-libs/multidict'
arch=('i686' 'x86_64')
license=('APACHE')
groups=('gns3')
depends=('python' 'glibc')
makedepends=('cython' 'python-setuptools')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2110f04c0cb5d38554a256229ed8eba9')

build() {
  cd ${_pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python3 setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

