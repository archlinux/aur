# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds
pkgname=python-misaka
_pkgname=misaka
pkgver=2.0.0
pkgrel=2
pkgdesc="A CFFI binding for Hoedown, a markdown parsing library."
arch=('i686' 'x86_64')
url="http://misaka.61924.nl/"
license=('MIT')
depends=('python')
options=(!emptydirs)
conflicts=('python-misaka-v1')
source=("https://pypi.python.org/packages/source/m/misaka/misaka-${pkgver}.tar.gz")
sha256sums=('336ef1381ab840046b7da9f95c4c28af17e636aed8dcfcf1efe972db05f73604')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
