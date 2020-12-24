# Maintainer: Arnaud Joset <info@agayon.be>

pkgname=python-plyer
_name=plyer
pkgver=2.0.0
pkgrel=1
pkgdesc="Platform-independent wrapper for platform-dependent APIs"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/kivy/plyer"
license=('MIT')
options=(!emptydirs)
source=(https://github.com/kivy/$_name/archive/$pkgver.tar.gz)
sha256sums=('21baf4a245f192a0a61c6f1d7526b28d4d4366039c62dac3fcd746b38aee161d')

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

