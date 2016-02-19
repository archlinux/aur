# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=finja
pkgver=1.0
pkgrel=1
pkgdesc="Index and find your stuff"
arch=('any')
license=('AGPL')
url='http://github.com/adfinis-sygroup/finja'
depends=('python' 'python-six' 'python-binaryornot')
makedepends=()
provides=('finja')
conflicts=('finja-git')
license=('AGPL3')
arch=('any')
source=(
    "https://pypi.python.org/packages/source/f/finja/finja-${pkgver}.tar.gz"
    "LICENSE::https://www.gnu.org/licenses/agpl.txt"
)
sha256sums=(
    '3795d64d6e3905f33aff28b659010b03f78f4d25188871966ddcc68b3d871548'
    '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6'
)

if [ -n "$VIRTUAL_ENV" ]; then
  echo "Warning: You're building within a virtualenv. Use"
  echo "a shell without virtualenv to build this package!"
  exit 1
fi


build() {
    cd $srcdir/finja-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/finja-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
