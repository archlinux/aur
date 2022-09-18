# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pyupgrade
pkgver=2.38.0
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('9c5b188ff72ac5cf91258f5315e8a2bc2e44cc1dcc566024e3b830c7dae3656abbbac8fb7263196133e051025c767c18b4177fcc186ace978d6dcfd6d69a5512')

build() {
  cd $pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

