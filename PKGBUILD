# Maintainer: Arnaud Joset <info@agayon.be>

pkgname=python-plyer
_name=plyer
pkgver=1.4.3
pkgrel=1
pkgdesc="Platform-independent wrapper for platform-dependent APIs"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/kivy/plyer"
license=('MIT')
options=(!emptydirs)
source=(https://github.com/kivy/$_name/archive/$pkgver.tar.gz)
sha256sums=('2efc899d6816016f4461cb76add378c9e7f527c89b5abeefc7cc2be0f8e6e8ed')

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

