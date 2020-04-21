# Maintainer: Austin Keller <austin474@gmail.com>

pkgname=python-jep
pkgver=3.9.0
pkgrel=1
pkgdesc="Java Embedded Python - Embeds CPython in Java through JNI"
arch=('any')
url="https://github.com/ninia/jep"
license=('ZLIB')
depends=('python-setuptools' 'python-numpy')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/5c/4c/ab6253ba5409ee787604dcbf1b02733aeed03ce0cf7d85a9ab5cfd4956b2/jep-$pkgver.tar.gz)
sha256sums=('7a15b6279b703c8af6b1f002186c542770f9059e8b3fe724914f664e67b7e595')

build() {
  cd jep-$pkgver
  python3 setup.py build
}

check() {
  cd jep-$pkgver
  python3 setup.py test
}

package() {
  cd jep-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
