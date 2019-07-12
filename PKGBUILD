# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=camb
pkgname=python-$_modulename
pkgver=1.0.6
pkgrel=2
pkgdesc="Code for Anisotropies in the Microwave Background"
arch=(any)
url="https://github.com/cmbant/CAMB"
license=('custom')
groups=()
depends=('python-numpy' 'gcc-fortran')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a33eaa474d8b8b7b7a494f9273134cf101d13db993473388cda425913b93793f')
#check() {
#  cd "$srcdir/CAMB-$pkgver/"
#  python setup.py test
#}
package() {
  cd "$srcdir/CAMB-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
