# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Michael Borders <michael.a.borders@gmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=python-parmed
_pkgname=ParmEd
pkgver=4.3.0
pkgrel=3
pkgdesc="General tool for aiding in investigations of biomolecular systems using popular molecular simulation packages"
arch=('x86_64')
url="https://parmed.github.io/ParmEd"
license=('LGPL-2.1-only')
depends=(
  'gcc-libs'
  'glibc'
  'python'
  'python-importlib-metadata'
  'python-lxml'
  'python-numpy'
  'python-scipy'
  'python-setuptools'
  'python-typing_extensions'
  'rdkit'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ParmEd/ParmEd/archive/${pkgver}.tar.gz")
b2sums=('66da35ece5f6c244b8205f3889bee3c86471b3d54814ba3dd6096ab5f057b1276d74b1fe4f37523a629ecb18412aafddc0ed13e68d24abe10dda40247d0b30e4')

build() {
  cd "ParmEd-$pkgver" || exit
  python setup.py build
}

check() {
  true
}

package(){
  cd "$srcdir/$_pkgname-$pkgver" || exit
  python setup.py install --root="$pkgdir/" --optimize=1
}
