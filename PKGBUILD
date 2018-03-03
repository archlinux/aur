# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python2-adal
pkgver=0.5.0
pkgrel=1
pkgdesc='ADAL for Python'
arch=('any')
url="https://github.com/AzureAD/azure-activedirectory-library-for-python"
license=('MIT')
depends=('python2-cryptography' 'python2-dateutil' 'python2-pyjwt' 'python2-requests')
source=("https://github.com/AzureAD/azure-activedirectory-library-for-python/archive/${pkgver}.tar.gz")
md5sums=('55e84c8038300609edc42b27097357d3')
makedepends=('python2-setuptools')

build() {
  cd "azure-activedirectory-library-for-python-$pkgver"
  python2 setup.py build
}

package() {
  cd "azure-activedirectory-library-for-python-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
