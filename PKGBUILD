# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-globster
pkgver=0.1.0
pkgrel=2
pkgdesc="Convert shell-like globs to regular expressions"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/tsileo/globster"
license=('GPL2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/g/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('c4695f698ff71573c674204163b08ef9')
sha256sums=('c7f8e536bb25e9077ea7f988e2bb6851d5f7ad32c37b0d8862c051a9754e9713')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
