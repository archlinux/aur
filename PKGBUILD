# Maintainer: erdii <me at erdii dot engineering>
# Maintainer: Alexander Bruegmann <mail at abruegmann dot eu>
pkgname=aws2-wrap
pkgver=1.1.9
pkgrel=1
pkgdesc="Simple script to export current AWS SSO credentials or run a sub-process with them"
arch=('any')
url="https://github.com/linaro-its/aws2-wrap"
license=('GPL3')
depends=('aws-cli' 'python-psutil')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('dd9ebf5ab39d6a331b3e9c424424f4a53260bfae70ef1c3bb757f01fc1a775b7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
