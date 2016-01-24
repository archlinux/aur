# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pif
pkgver=0.7.3
pkgrel=1
pkgdesc="Public IP address checker"
arch=('any')
depends=('python2' 'python2-requests')
makedepends=('python2-setuptools')
url="https://github.com/barseghyanartur/pif"
license=('custom')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('583cd925b9d215bfb4e0d995fab9081c')
sha256sums=('e6a792a6d06e9ec852a0bde4c999b5e58c571a5c0b7b06234c5c103a6b405a77')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
