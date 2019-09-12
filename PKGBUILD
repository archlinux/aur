# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-apply_defaults
_name=apply_defaults
pkgver=0.1.3
pkgrel=2
pkgdesc="Apply default values to functions. Makes configuration easy! Application settings come from a config file into your code cleanly."
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-nose')
url="https://github.com/bcb/apply_defaults"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('ce7eed01ab3830a701f5c5b7a0322061fbdb1639458350ec76ea27526b2373c8')

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
