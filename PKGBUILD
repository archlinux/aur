# Maintainer: Manolo Martínez <manolo@austrohungaro.com>

_pkgname=stagger
pkgname=python-stagger-git
pkgver=1.0.0
pkgrel=1
pkgdesc="ID3v1/ID3v2 tag manipulation package in pure Python 3"
arch=(any)
url="https://github.com/lorentey/stagger"
license=('BSD')
depends=('python')
makedepends=('git')
provides=('python-stagger-git')
conflicts=('python3-stagger-svn')
source=('git://github.com/lorentey/stagger.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --tags --always | sed -e 's|-|.|g'
}

package() {
  cd "$srcdir/$_pkgname"

  msg "Running setup.py..."
  python setup.py install --root="${pkgdir}" --optimize=1
} 
