# Maintainer: Eshan Ramesh find me at esrh.sdf.org

pkgname=jrnl-git
_gitname=jrnl
pkgver=v2.8.1.r12.g5e87ff1
pkgrel=3
pkgdesc="Collect your thoughts and notes without leaving the command line"
arch=('any')
url="https://jrnl.sh/"
license=('GPL3')
depends=('python' 'python-ansiwrap' 'python-asteval' 'python-colorama' 'python-cryptography' 'python-keyring' 'python-parsedatetime' 'python-dateutil' 'python-pyxdg' 'python-pyaml')
checkdepends=('python-behave' 'python-pytest' 'python-black' 'python-poetry')
makedepends=('git' 'make')
conflicts=("jrnl")
source=("git+https://github.com/jrnl-org/jrnl.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "$_gitname"
  #black setup.py --diff | patch
  make test
}

package() {
  cd "$_gitname"
  make install
}

