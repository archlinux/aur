# Maintainer: kpj <kpjkpjkpjkpjkpjkpj at gmail dot com>

pkgname='python-maybe'
pkgver=0.3.0
pkgrel=1
pkgdesc='See what a program does before deciding whether you really want it to happen.'
arch=('any')
url='https://github.com/p-e-w/maybe'
license=('GPLv3')
depends=('python-blessings' 'python-ptrace')
makedepends=('python' 'python-pip')
source=(https://pypi.python.org/packages/source/m/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('c0cc40374b4616413006a2158ebc1652')

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
