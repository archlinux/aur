# Packager: Darshit Shah <darnir@gmail.com>
# Maintainer: Darshit Shah <darnir@gmail.com>

pkgname=python-vint
_pkgname=vint
pkgver=0.3.19
pkgrel=1
pkgdesc="VimL Linter"
arch=('any')
makedepends=('python-setuptools')
depends=('python-yaml' 'python-ansicolor>=0.2.4' 'python-chardet')
url="https://github.com/Kuniwak/vint/"
license=('MIT')
options=(!emptydirs)
source=(https://github.com/Kuniwak/vint/archive/v${pkgver}.tar.gz)
md5sums=('eb5b9edf57a59657b9f5a36baf954bab')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
