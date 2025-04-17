# Maintainer: Paul Irofti <paul@irofti.net>
_name=custom_inherit
pkgname="python-$_name"
pkgver=2.4.1
pkgrel=2
pkgdesc="convenient, light-weight tools for inheriting docstrings"
arch=('any')
url="https://github.com/rsokl/custom_inherit"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-versioneer')
#source=("https://files.pythonhosted.org/packages/source/g/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7052eb337bcce83551815264391cc4efc2bf70b295a3c52aba64f1ab57c3a8a2')

build() {
  cd "$srcdir/$_name-$pkgver"
  rm versioneer.py
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
