# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=('python-pybrain')
pkgver=0.3.3
pkgrel=1
pkgdesc='A modular Machine Learning Library for Python'
arch=('any')
url='http://pybrain.org/'
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/pybrain/pybrain#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd pybrain
  python setup.py build
}

package() {
  cd pybrain
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
