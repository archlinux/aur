# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Michael Spradling <mike@mspradling.com>

_name=EasyProcess
pkgname=python-easyprocess
pkgver=0.2.10
pkgrel=1
pkgdesc="easy to use python subprocess interface"
arch=(any)
url="https://github.com/ponty/EasyProcess"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('636b5e30222cde1e881fafc0112b35d516bce41ddee83ecbac656dec9befea1b')


build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
