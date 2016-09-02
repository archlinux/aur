# Packager: Darshit Shah <darnir@gmail.com>
# Maintainer: Darshit Shah <darnir@gmail.com>

pkgname=python-vint
_pkgname=vim-vint
pkgver=0.3.10
pkgrel=2
pkgdesc="VimL Linter"
arch=('any')
makedepends=('python-setuptools')
depends=('python-yaml' 'python-ansicolor=0.2.4' 'python-chardet')
url="https://github.com/Kuniwak/vint/"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/00/1d/7190e5b12906498d8a83e437a6440c83ad25059b69d04362ac1588cf4f6f/vim-vint-0.3.10.tar.gz)
md5sums=('7b902b98534cfc69ae0e471dedacadda')

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
