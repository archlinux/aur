# Maintainer: renek <aur@spaceshore.net>
_pkgname=multidict
pkgname=python-${_pkgname}
pkgver=2.1.4
pkgrel=1
pkgdesc="An asyncio-based multidict implementation for Python"
arch=('any')
url='https://github.com/aio-libs/multidict'
license=('APACHE')
depends=('python')
makedepends=('cython' 'python-setuptools')
source=("https://github.com/aio-libs/multidict/archive/v${pkgver}.tar.gz")
sha512sums=('1806f21a528f907ba16cada2eda05c7387d63bec45b7906a5a37eba834a87553c402766f4e50425a41414e93e2fc202d18ad9e6aaf02742fe06899e6a18109c8')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
