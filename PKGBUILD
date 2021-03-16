# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgbase=python-camb
pkgname=("python-camb")  
pkgver=1.3.2
pkgrel=0
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
sha256sums=('38e49aa1e5b856ff2efd909490fde60682287811703fabf418afbc81347cd0c2')
package() {
  depends=('python-numpy' 'gcc-fortran')
  cd "$srcdir/CAMB-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
