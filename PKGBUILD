# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-msrestazure
pkgver=0.6.0
pkgrel=1
pkgdesc="The runtime library \"msrestazure\" for AutoRest generated Python clients."
arch=('any')
url="https://github.com/Azure/msrestazure-for-python"
license=('MIT')
depends=('python-adal' 'python-keyring' 'python-msrest')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrestazure-for-python/archive/v${pkgver}.tar.gz")
sha256sums=('3b392971c0b95975b185b73b6e25c502175b42a30b80ccd7f04f099fe129c36c')

build() {
  cd "msrestazure-for-python-${pkgver}"
  python setup.py build
}

package() {
  cd "msrestazure-for-python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

