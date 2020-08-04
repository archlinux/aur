# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=psptool
pkgname=psptool-git
pkgver=r107.3a33820
pkgrel=1
pkgdesc="Swiss Army knife for dealing with firmware of the AMD Secure Processor"
arch=('any')
url="https://pslab.io"
license=('GPL3')
depends=(
  'ipython'
  'python'
  'python-cryptography'
  'python-prettytable'
  'python-setuptools'
)
provides=("$_pyname")
conflicts=($_pyname)
options=(!emptydirs)
source=(git://github.com/PSPReverse/$_pyname.git)
sha512sums=('SKIP')

pkgver() {
  cd "$_pyname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pyname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
