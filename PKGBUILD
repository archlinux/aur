# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python-virtualenvondemand
pkgver=6.0.0
pkgrel=2
pkgdesc="Easily create and use virtualenvs via script and provides the ability for an application to install and use its runtime dependencies on first import"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/VirtualEnvOnDemand"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python-virtualenv' 'python-pip' 'python')
source=("https://github.com/kata198/VirtualEnvOnDemand/archive/${pkgver}.tar.gz")
sha512sums=('9faa48b7015a6656a2f53a64f4aab8c41ca830c74fccebf157c5cd06683b518f94bd70b2e2d7026da790adef3c4780099494e9e2031b033d6e27f2d98721dace')

build() {
  cd "$srcdir"/VirtualEnvOnDemand-$pkgver
  python setup.py build
}

package() {
  cd VirtualEnvOnDemand-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

