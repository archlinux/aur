# Maintainer: Jörg Hansen <joerg DOT hansen AT posteo DOT de>
# Contributor: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-fritzconnection-git
pkgver=1.2.1.r17.g29ececd
pkgrel=1
pkgdesc='Python-Tool to communicate with the AVM Fritz!Box.'
license=('MIT')
arch=('any')
url='https://github.com/kbr/fritzconnection'
depends=(
  'python-requests'
)
makedepends=(
  'python-setuptools'
)
source=("git+https://github.com/kbr/fritzconnection.git")
sha512sums=('SKIP')

pkgver() {
  cd fritzconnection
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd fritzconnection
  python setup.py build
}

package() {
  cd fritzconnection
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
