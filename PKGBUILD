# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=finja
pkgver=1.1.1
pkgrel=2
pkgdesc="Index and find your stuff"
arch=('any')
license=('AGPL')
url='http://github.com/adfinis-sygroup/finja'
depends=('python' 'python-six' 'python-binaryornot' 'python-chardet' 'sqlite3' 'python-termcolor')
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
    'c2a28bff364dac07dc34929af6ca46d6f09ba38e5469b19c9629ba174620b790'
    '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
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
