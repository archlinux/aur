# Contributor: Joel Pedraza <pkgs@joelpedraza.com>
# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>

pkgname=python-humblebundle-git
pkgver=0.1.1.r0.g32bb05c
pkgrel=2
pkgdesc="An unofficial library for querying the Humble Bundle API (git version)"
arch=('any')
url="https://github.com/saik0/humblebundle-python"
license=('MIT')
makedepends=('python' 'python-setuptools' 'git')
depends=('python-requests')
provides=('python-humblebundle')
conflicts=('python-humblebundle')
options=(!emptydirs)
source=('git+https://github.com/saik0/humblebundle-python.git')
sha1sums=('SKIP')
_repo=humblebundle-python

pkgver() {
  cd "$srcdir/$_repo"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_repo"
  python setup.py install --root="$pkgdir/" --optimize=1
}
