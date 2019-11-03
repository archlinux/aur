# Maintainer: Arnaud Joset <info@agayon.be>

pkgname=python-plyer
_name=plyer
pkgver=1.4.2
pkgrel=1
pkgdesc="Platform-independent wrapper for platform-dependent APIs"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/kivy/plyer"
license=('MIT')
options=(!emptydirs)
source=(https://github.com/kivy/$_name/archive/$pkgver.tar.gz)
md5sums=('bffe5a387fe24c30af0bc44e4fb193df')

build() {
  cd "$srcdir/${_name}-$pkgver"

  msg 'Installing...'
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}

