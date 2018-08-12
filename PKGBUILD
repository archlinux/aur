# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python2-adal
pkgver=1.0.2
pkgrel=1
pkgdesc='ADAL for Python'
arch=('any')
url="https://github.com/AzureAD/azure-activedirectory-library-for-python"
license=('MIT')
depends=('python2-cryptography' 'python2-dateutil' 'python2-pyjwt' 'python2-requests')
source=("https://github.com/AzureAD/azure-activedirectory-library-for-python/archive/${pkgver}.tar.gz")
sha256sums=('78aba759372817f6fa63d8f758c49ea92baa9e9a3ecbf876b5da5f36d2330162')
makedepends=('python2-setuptools')

build() {
  cd "azure-activedirectory-library-for-python-$pkgver"
  python2 setup.py build
}

package() {
  cd "azure-activedirectory-library-for-python-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
