# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pyupgrade
pkgver=3.2.2
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('2a528c4aa276a8908006e4e01f103c28da9014008bd817fbd686d24da45cdedc64c168da7c191a2e8963c6a88f2dc0c1d98a8856f990bd1eb585b52fbe99e66c')

build() {
  cd $pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

