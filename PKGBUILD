# Maintainer: Bet4 <bet4it@gmail.com>

pkgname=jnitrace
pkgver=3.3.0
pkgrel=1
pkgdesc="A Frida based tool that traces usage of the JNI API in Android apps"
arch=('any')
url="https://github.com/chame1eon/jnitrace"
license=('MIT')
depends=('python-frida' 'python-hexdump')
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ed2d5c0729e1d6e6c50334e04751a43e7b7c107b4d8253791e8bfafb718c9c18')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
