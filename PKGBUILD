# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pytest-timeout
pkgver=0.4
pkgrel=1
pkgdesc="py.test plugin to abort hanging tests"
arch=('any')
depends=('python2' 'python2-pytest')
makedepends=('python2-setuptools')
url="https://bitbucket.org/flub/pytest-timeout"
license=('MIT')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz"{,.asc})
md5sums=('03b28aff69cbbfb959ed35ade5fde262'
         'SKIP')
sha256sums=('d5900aaa94af5cb2d06ed806b1e636255e65a8a26eccecccd2b9a9d6123d50d5'
            'SKIP')
validpgpkeys=('0FB1803BC91D1B601E2A2C22702A26DB4CCB3FFC')

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
