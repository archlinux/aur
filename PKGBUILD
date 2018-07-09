# Maintainer: Ilya Elenskiy <elenskiy.ilya[@]gmail[.]com>

pkgname=python-pycomedi-git
_name=pycomedi
pkgver=0.9.r4.g4217db0
pkgrel=1
pkgdesc="An object-oriented interface for the Comedi drivers. This packages provides the most up-to-date branch on GitHub, which is currently in ian-abbott's fork."
arch=('x86_64' 'i686')
url='https://github.com/ian-abbott/pycomedi/'
license=('GPL2')
provides=( 'python-pycomedi' 'python-comedi' )
depends=( 'python-numpy' 'comedilib')
makedepends=( 'cython' )
source=("pycomedi::git+https://github.com/ian-abbott/pycomedi.git#branch=ija-comedilib-0-11-compat")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_name}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}
