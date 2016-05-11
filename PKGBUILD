# Maintainer: LaszLo Papp <lpapp@kde.org>

pkgname=python2-forgerypy
pkgver=0.1
pkgrel=1
pkgdesc="An easy to use forged data generator for Python"
arch=('any')
url="https://pypi.python.org/pypi/ForgeryPy"
license=('MIT')
depends=('python2')
source=(https://pypi.python.org/packages/source/F/ForgeryPy/ForgeryPy-${pkgver}.tar.gz)
md5sums=('66555becf769d7a7921b0d6183b2f953')

build() {
  cd "$srcdir"/ForgeryPy-${pkgver}
  python2 setup.py build
}

package() {
  cd "$srcdir"/ForgeryPy-${pkgver}
  python2 setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
