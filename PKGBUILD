# Packager: Darshit Shah <darnir@gmail.com>
# Maintainer: Darshit Shah <darnir@gmail.com>

pkgname=python-vint
_pkgname=vim-vint
pkgver=0.3.6
pkgrel=1
pkgdesc="VimL Linter"
arch=('any')
makedepends=('python-setuptools')
depends=('python-ansicolor=0.2.4')
url="https://pypi.python.org/pypi/Mercurial"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/v/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('3b2d95c180bfab51aa690aa7ecd2c23f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
