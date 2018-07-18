# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-qdarkstyle
pkgver=2.5.4
pkgrel=1
pkgdesc="A dark stylesheet for Python and Qt applications"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/ColinDuquesnoy/QDarkStyleSheet"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ColinDuquesnoy/QDarkStyleSheet/tar.gz/$pkgver)
sha256sums=('8dd03866bdb288c0c6f0ada3cebce3bd97e117ce776914533bbb1f8327c3ee24')

build() {
  cd "$srcdir/QDarkStyleSheet-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/QDarkStyleSheet-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
