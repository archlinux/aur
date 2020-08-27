# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-msrestazure
pkgver=0.6.4
pkgrel=1
pkgdesc="The runtime library \"msrestazure\" for AutoRest generated Python clients."
arch=('any')
url="https://github.com/Azure/msrestazure-for-python"
license=('MIT')
depends=('python-adal' 'python-keyring' 'python-msrest')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrestazure-for-python/archive/v${pkgver}.tar.gz")
sha256sums=('7e9ca8fccf8fc24286f8aaef90e69534c92989d3f2eaebc83fd59523f30d7a4a')

build() {
  cd "msrestazure-for-python-${pkgver}"
  python setup.py build
}

package() {
  cd "msrestazure-for-python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

