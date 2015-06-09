# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-dirtools
pkgver=0.2.0
pkgrel=1
pkgdesc="Exclude/ignore files in a directory (using .gitignore like syntax), compute hash, search projects for an entire directory tree and gzip compression"
arch=('any')
depends=('python2' 'python2-globster')
makedepends=('python2-setuptools')
url="https://github.com/tsileo/dirtools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/d/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('819ebf8044e51bbd1967a9c4e8c94564')
sha256sums=('59a9cd97e622aad22b142344ba36a62903ba0ba2e11b5f028fea34442eab14df')

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
