# Packager: Darshit Shah <darnir@gmail.com>
# Maintainer: Darshit Shah <darnir@gmail.com>

pkgname=python-vint
_pkgname=vim-vint
pkgver=0.3.9
pkgrel=1
pkgdesc="VimL Linter"
arch=('any')
makedepends=('python-setuptools')
depends=('python-yaml' 'python-ansicolor=0.2.4' 'python-chardet')
url="https://github.com/Kuniwak/vint/"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/8c/a4/e59fe09db6fe124d039bda3a23c03dd8dc98f9911eea48858b60180c69f8/vim-vint-0.3.9.tar.gz)
md5sums=('7547c5d87d04b2ed2ae9e9a3e9cf9b41')

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
