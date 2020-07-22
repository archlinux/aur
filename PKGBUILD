# Maintainer: Bet4 <bet4it@gmail.com>

pkgname=jnitrace
pkgver=3.0.8
pkgrel=1
pkgdesc="A Frida based tool that traces usage of the JNI API in Android apps"
arch=('any')
url="https://github.com/chame1eon/jnitrace"
license=('MIT')
depends=('python-frida' 'python-hexdump')
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('127a54a7ef0869d7f109a507705a9e71b4fc0741610e48b67d5ca2c461106a49')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
