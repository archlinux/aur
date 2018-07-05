# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python-adal
pkgver=1.0.2
pkgrel=1
pkgdesc='ADAL for Python'
arch=('any')
url="https://github.com/AzureAD/azure-activedirectory-library-for-python"
license=('MIT')
depends=('python-cryptography' 'python-dateutil' 'python-pyjwt' 'python-requests')
source=("https://github.com/AzureAD/azure-activedirectory-library-for-python/archive/${pkgver}.tar.gz")
sha256sums=('78aba759372817f6fa63d8f758c49ea92baa9e9a3ecbf876b5da5f36d2330162')
makedepends=('python-setuptools')

build() {
  cd "azure-activedirectory-library-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "azure-activedirectory-library-for-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
