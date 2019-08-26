# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgbase=python-camb
pkgname=("python-camb" "python2-camb")  
pkgver=1.0.7
pkgrel=1
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
sha256sums=('a33eaa474d8b8b7b7a494f9273134cf101d13db993473388cda425913b93793f')

package_python-camb() {
  depends=('python-numpy' 'gcc-fortran')
  cd "$srcdir/CAMB-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}

package_python2-camb() {
  depends=('python2-numpy' 'gcc-fortran')
  cd "$srcdir/CAMB-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
