# Packager: Darshit Shah <darnir@gmail.com>
# Maintainer: Darshit Shah <darnir@gmail.com>

pkgname=python-vint
_pkgname=vim-vint
pkgver=0.3.13
pkgrel=0
pkgdesc="VimL Linter"
arch=('any')
makedepends=('python-setuptools')
depends=('python-yaml' 'python-ansicolor=0.2.4' 'python-chardet')
url="https://github.com/Kuniwak/vint/"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/3d/96/878852674921e9c735df7b00d3161746e111bfe3e9f9970b4f1f5adbc1bd/vim-vint-0.3.13.tar.gz)
md5sums=('fc797b580c755c307b04f1c22f490dd2')

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
