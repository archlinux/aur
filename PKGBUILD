# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=('python2-pybrain')
pkgver=0
pkgrel=1
pkgdesc='A modular Machine Learning Library for Python'
arch=('i686' 'x86_64')
url='http://pybrain.org/'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools' 'git')
source=("git+https://github.com/pybrain/pybrain.git")
sha512sums=('SKIP')

pkgver() {
  cd pybrain
  git describe --always | sed 's|-|.|g'

}

build() {
  cd pybrain
  python2 setup.py build
}

package() {
  cd pybrain
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
