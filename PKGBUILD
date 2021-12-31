# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=getdist
pkgname=python-$_modulename
pkgver=1.3.3
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
sha256sums=('6c3a28850c0c4c320928724f1a75066dcac5266b6192e5cf55b7f874d0413d42')
build() {
  cd "$srcdir/$_modulename-$pkgver/"
  python setup.py build
}
package() {
  cd "$srcdir/$_modulename-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
