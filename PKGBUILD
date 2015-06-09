# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-funky
pkgver=0.0.2
pkgrel=2
pkgdesc="A package of some useful 'functionnal' constructs for Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/FriendCode/funky/"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/f/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('319ba036c2640e9f6bfad61192672e91')
sha256sums=('23ac10d87e90bb7bd0ae839d3ab05f34f5720273e43044bffe8b9ce8af318ad6')
provides=('funky' 'python2-funky')
conflicts=('funky')

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
