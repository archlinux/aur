# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=fastkde
pkgname=python-$_modulename
pkgver=1.0.14
pkgrel=1
pkgdesc="Fast kernel density estimation"
arch=(any)
url="https://bitbucket.org/lbl-cascade/fastkde"
license=()
groups=()
depends=('python-numpy' 'python-scipy' 'cython')
makedepends=('python-setuptools' 'python-numpy')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/get/v${pkgver}.tar.gz")
sha256sums=('7731af4ad0712573b9544991d9ab7c45ddaa90608683f9e2ccf072251066a3bb')

package() {
  cd "$srcdir/$(tar -tf v${pkgver}.tar.gz | head -n1)"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
