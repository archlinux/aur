# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgbase=python-camb
pkgname=("python-camb" "python2-camb")  
pkgver=1.0.9
pkgrel=2
pkgdesc="Code for Anisotropies in the Microwave Background"
arch=(any)
url="https://github.com/cmbant/CAMB"
license=('custom')
groups=()
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('14740ca4034e11c334bf1786c41fb13c0819f82d7e4df383237bb18a416d8ff6')

package_python-camb() {
  depends=('python-numpy' 'gcc-fortran')
  cd "$srcdir/CAMB-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}

package_python2-camb() {
  depends=('python2-numpy' 'gcc-fortran')
  cd "$srcdir/CAMB-$pkgver/"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
