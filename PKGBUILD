# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com> 
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python-adal
pkgver=1.2.1
pkgrel=1
pkgdesc='ADAL for Python'
arch=('any')
url="https://github.com/AzureAD/azure-activedirectory-library-for-python"
license=('MIT')
depends=('python-cryptography' 'python-dateutil' 'python-pyjwt' 'python-requests')
source=("https://github.com/AzureAD/azure-activedirectory-library-for-python/archive/${pkgver}.tar.gz")
sha256sums=('fab9d04d1eccc10c429f70d479bb60f22a24da272cf00c763e42b3e9cf3865e3')
makedepends=('fakeroot' 'python-setuptools')

build() {
  cd "azure-activedirectory-library-for-python-${pkgver}"
  python setup.py build
}

package() {
  cd "azure-activedirectory-library-for-python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

