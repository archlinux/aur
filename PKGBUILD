# Maintainer: Bet4 <bet4it@gmail.com>

pkgname=jnitrace
pkgver=3.3.1
pkgrel=1
pkgdesc="A Frida based tool that traces usage of the JNI API in Android apps"
arch=('any')
url="https://github.com/chame1eon/jnitrace"
license=('MIT')
depends=('python-frida' 'python-hexdump')
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6fc6b39a561b34415250ddcc8eaa54a8d9414ca4f42532e909506493d471efed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
