# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-qdarkstyle
pkgver=2.7
pkgrel=1
pkgdesc="A dark stylesheet for Python and Qt applications"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/ColinDuquesnoy/QDarkStyleSheet"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ColinDuquesnoy/QDarkStyleSheet/tar.gz/$pkgver)
sha256sums=('a5c345ab3e518d65faa60caadaac3e0e9bd9613724b27b45b70aa50a26eb4893')

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
