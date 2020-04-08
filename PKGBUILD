# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-aktools
pkgver=0.0.14
pkgrel=1
pkgdesc="AkTools is an elegant and simple HTTP server library for AkShare, built for aksharers"
arch=('any')
url='https://aktools.readthedocs.io'
license=('MIT')
provides=('aktools')
depends=('python-akshare'
		 'python-fastapi')
makedepends=('python-setuptools')
source=("https://github.com/jindaxiang/aktools/archive/v${pkgver}.tar.gz")
md5sums=('8251cf12fde886e0544c021e5d59e2f8')

build() {
  cd ${srcdir}/aktools-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/aktools-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}