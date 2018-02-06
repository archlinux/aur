# Packager: Darshit Shah <darnir@gmail.com>
# Maintainer: Darshit Shah <darnir@gmail.com>

pkgname=python-vint
_pkgname=vint
pkgver=0.3.18
pkgrel=0
pkgdesc="VimL Linter"
arch=('any')
makedepends=('python-setuptools')
depends=('python-yaml' 'python-ansicolor=0.2.4' 'python-chardet' 'python-typing')
url="https://github.com/Kuniwak/vint/"
license=('MIT')
options=(!emptydirs)
source=(https://github.com/Kuniwak/vint/archive/v${pkgver}.tar.gz)
md5sums=('55566ca525bc7a532752e759e872388f')

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
