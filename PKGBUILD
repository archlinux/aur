# Maintainer: Arnaud Joset <info@agayon.be>

pkgname=python-plyer
_name=plyer
pkgver=2.1.0
pkgrel=1
pkgdesc="Platform-independent wrapper for platform-dependent APIs"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/kivy/plyer"
license=('MIT')
options=(!emptydirs)
source=(https://github.com/kivy/$_name/archive/$pkgver.tar.gz)
sha256sums=('ea95f48ad127faf43a35917a002a2e292d3449f2394b6794b8ecd59f710b5fe0')

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

