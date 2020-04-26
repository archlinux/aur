# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-msrestazure
pkgver=0.6.3
pkgrel=1
pkgdesc="The runtime library \"msrestazure\" for AutoRest generated Python clients."
arch=('any')
url="https://github.com/Azure/msrestazure-for-python"
license=('MIT')
depends=('python-adal' 'python-keyring' 'python-msrest')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrestazure-for-python/archive/v${pkgver}.tar.gz")
sha256sums=('c429caaf44494063ae006f0de497c0c23eea75880e532a2a087ac2a61e096cbc')

build() {
  cd "msrestazure-for-python-${pkgver}"
  python setup.py build
}

package() {
  cd "msrestazure-for-python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

