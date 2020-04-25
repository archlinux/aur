# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgbase=python-camb
pkgname=("python-camb")  
pkgver=1.1.2
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
sha256sums=('b1e3f76eb82261072647646196745db7ed490f83abe460c2968ef0b86bfe1bbf')
package() {
  depends=('python-numpy' 'gcc-fortran')
  cd "$srcdir/CAMB-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
