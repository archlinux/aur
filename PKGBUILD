# Maintainer: Bet4 <bet4it@gmail.com>

pkgname=jnitrace
pkgver=3.1.0
pkgrel=1
pkgdesc="A Frida based tool that traces usage of the JNI API in Android apps"
arch=('any')
url="https://github.com/chame1eon/jnitrace"
license=('MIT')
depends=('python-frida' 'python-hexdump')
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e2edcdbcbee2396912762a5d21cc81f895e297e92875fabdd79d4f222ea5e744')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
