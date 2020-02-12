# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=getdist
pkgname=python-$_modulename
pkgver=1.1.0
pkgrel=1
pkgdesc="MCMC sample analysis, kernel densities, plotting, and GUI"
arch=(any)
url="https://github.com/cmbant/getdist"
license=()
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-six' 'python-scipy' 'python-pyside' 'python-pandas')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('064e6c5117715c8a670d0dd71554552386932b8eb2a44f51fb67ea915ac1b459')

package() {
  cd "$srcdir/$_modulename-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
check() {
  cd "$srcdir/$_modulename-${pkgver}"
  python setup.py test
}
