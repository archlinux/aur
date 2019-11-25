# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-msrestazure
pkgver=0.6.2
pkgrel=1
pkgdesc="The runtime library \"msrestazure\" for AutoRest generated Python clients."
arch=('any')
url="https://github.com/Azure/msrestazure-for-python"
license=('MIT')
depends=('python-adal' 'python-keyring' 'python-msrest')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrestazure-for-python/archive/v${pkgver}.tar.gz")
sha256sums=('f74d814304ef11ba75073ad55d284eb9a4d6da8425a245548ac7859f69736418')

build() {
  cd "msrestazure-for-python-${pkgver}"
  python setup.py build
}

package() {
  cd "msrestazure-for-python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

