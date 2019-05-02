# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-qdarkstyle
pkgver=2.6.8
pkgrel=1
pkgdesc="A dark stylesheet for Python and Qt applications"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/ColinDuquesnoy/QDarkStyleSheet"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ColinDuquesnoy/QDarkStyleSheet/tar.gz/$pkgver)
sha256sums=('ffd800bd3960f45a49ee8c8dc4c36501a19e3b71dae60ba686060bec2e1b6881')

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
