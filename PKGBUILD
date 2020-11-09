# Maintainer: Will Price <will.price94@gmail.com>
pkgname=python-migen-git
pkgrel=1
pkgdesc="A  python toolbox for building complex digital hardware"
arch=('i686' 'x86_64')
url="https://github.com/m-labs/migen"
license=('BSD')
makedepends=('git' 'python-setuptools')
depends=('python')
provides=('migen')
options=(!emptydirs)
source=('git+https://github.com/m-labs/migen.git')
md5sums=('SKIP')
pkgver=0.9.2.rcc6e76e
provides=(python-migen)

pkgver() {
  cd "${srcdir}/migen"
  git describe --long --tags | sed 's/\([^-]*-g\)/r/;s/-/./g'
}

package() {
  cd "${srcdir}/migen"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
