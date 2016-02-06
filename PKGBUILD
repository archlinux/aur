# Maintainer: kpj <kpjkpjkpjkpjkpjkpj at gmail dot com>

pkgname='python-maybe'
pkgver=0.2.1
pkgrel=1
pkgdesc='See what a program does before deciding whether you really want it to happen.'
arch=('any')
url='https://github.com/p-e-w/maybe'
license=('GPLv3')
depends=('python-blessings' 'python-ptrace')
makedepends=('python' 'python-pip')
source=(https://pypi.python.org/packages/source/m/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('7eebbe47c1cf5f314153a45823e2a823')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
