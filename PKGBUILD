# Maintainer: Will Price <will.price94@gmail.com>
pkgname=migen-git
pkgrel=1
pkgdesc="A  python toolbox for building complex digital hardware"
arch=('i686' 'x86_64')
url="https://github.com/m-labs/migen"
license=('BSD')
depends=('python')
provides=('migen')
options=(!emptydirs)
source=('git+https://github.com/m-labs/migen.git')
md5sums=('SKIP')
pkgver=0.2.r8a514e9

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
