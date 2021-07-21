# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-apply_defaults
_name=apply_defaults
pkgver=0.1.6
pkgrel=1
pkgdesc="Apply default values to functions. Makes configuration easy! Application settings come from a config file into your code cleanly."
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-nose')
url="https://github.com/bcb/apply_defaults"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('3773de3491b94c0fe44310f1a85888389cdc71e1544b343bce0d2bd6991acea5')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

check(){
    cd "$srcdir/$_name-$pkgver"

    # For nosetests
    nosetests
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
