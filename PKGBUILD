# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python-msrest
pkgver=0.6.13
pkgrel=1
pkgdesc='The runtime library for AutoRest generated Python clients.'
arch=('any')
url="https://github.com/Azure/msrest-for-python"
license=('MIT')
depends=('python-isodate' 'python-requests-oauthlib')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrest-for-python/archive/v${pkgver}.tar.gz")
sha256sums=('f067220ad82946ab128c0a3461fc065ee73335a776c74c925bfb54fc23af6eb8')

build() {
  cd "msrest-for-python-${pkgver}"
  python setup.py build
}

package() {
  cd "msrest-for-python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

