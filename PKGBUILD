# Maintainer: Victor Häggqvist <aur@snilius.com>

pkgname=python-pyfiglet
pkgver=0.7.5
pkgrel=1
pkgdesc="An implementation of figlet written in python"
url="https://github.com/pwaller/pyfiglet"
license=('GPL2')
groups=()
arch=('any')
depends=('python')
makedepends=('python-setuptools')
provides=('python-pyfiglet')
conflicts=('python-pyfiglet')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/pyfiglet/pyfiglet-${pkgver}.tar.gz)
sha512sums=('835a2710c576e3695388bcad60c93bd58394bdd263cce9b51bfd8d1d82582765924215bf1e7560b7be01d4551923b29f56c2e063e646ef5cffc970521e2cbfb2')


build() {
  cd "$srcdir/pyfiglet-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/pyfiglet-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
