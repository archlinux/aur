# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pyupgrade
pkgver=2.38.1
pkgrel=2
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('6350a131d480d0aa166b2368fe883ed15010cc888504fb2cc1fcf24f64273ea1e4418db4654e1ab575c4792e2208e519826dfe7d3345ffd37ea4962d28d4b553')

build() {
  cd $pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

