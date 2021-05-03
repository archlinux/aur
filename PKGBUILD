# Maintainer: Bet4 <bet4it@gmail.com>

pkgname=jnitrace
pkgver=3.2.2
pkgrel=1
pkgdesc="A Frida based tool that traces usage of the JNI API in Android apps"
arch=('any')
url="https://github.com/chame1eon/jnitrace"
license=('MIT')
depends=('python-frida' 'python-hexdump')
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ad2716fa4225bfb20f6abc5716b23cb26272f682742c7b9cce1146ac9022ba08')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
