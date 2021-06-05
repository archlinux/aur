# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=getdist
pkgname=python-$_modulename
pkgver=1.3.0
pkgrel=1
pkgdesc="MCMC sample analysis, kernel densities, plotting, and GUI"
arch=(any)
url="https://github.com/cmbant/getdist"
license=()
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-six' 'python-scipy' 'python-pyside2' 'python-pandas')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('8828031446fc91c0725f970c11bc79ad3442f8ea0360daebadd60ceaaed79a60')
build() {
  cd "$srcdir/$_modulename-$pkgver/"
  python setup.py build
}
package() {
  cd "$srcdir/$_modulename-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
