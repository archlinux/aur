# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-msrestazure
pkgver=0.6.1
pkgrel=1
pkgdesc="The runtime library \"msrestazure\" for AutoRest generated Python clients."
arch=('any')
url="https://github.com/Azure/msrestazure-for-python"
license=('MIT')
depends=('python-adal' 'python-keyring' 'python-msrest')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrestazure-for-python/archive/v${pkgver}.tar.gz")
sha256sums=('169268a64815e7aa2a812b12e58877a0942eea6fe1411dcd5d2672d9918cd377')

build() {
  cd "msrestazure-for-python-${pkgver}"
  python setup.py build
}

package() {
  cd "msrestazure-for-python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

