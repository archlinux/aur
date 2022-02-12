# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=pls
pkgver=1.8.2
pkgrel=1
pkgdesc='A better ls for developers'
url='https://pypi.org/project/pls/'
arch=('any')
license=('GPL3')
depends=(
  'python-yaml'
  'python-rich'
)
makedepends=(
  'git'
  'python-dephell'
)

source=($pkgname::"git+https://github.com/dhruvkb/pls#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cd $pkgname
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" -O1 --skip-build
}
