# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-genty'
_name="${pkgname#python2-}"
pkgver=1.3.2
pkgrel=8
pkgdesc='Allows you to run a test with multiple data sets (deprecated)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=('python2-six')
makedepends=(
  'git'
  'python2-setuptools'
)
checkdepends=('python2-mock')
source=("git+https://github.com/box/${_name}.git#tag=v${pkgver}")
b2sums=('SKIP')

build() {
  cd "${_name}"
  python2 setup.py build
}

check() {
  cd "${_name}"
  python2 setup.py test
}

package() {
  cd "${_name}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
