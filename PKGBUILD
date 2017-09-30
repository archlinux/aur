# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=class
pkgname=python-$_modulename
pkgver=2.6
pkgrel=1
pkgdesc="CLASS: Cosmic Linear Anisotropy Solving System"
arch=(any)
url="https://github.com/lesgourg/class_public"
license=()
groups=()
depends=('cython')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('f642b3e99996387f6e66ec726886cb2aaff365d9203ecda3708fc39d49486f30')
package() {
  cd "$srcdir/class_public-$pkgver/"
  make -j libclass.a
  cd python
  sed -i 's/libraries=\["class"\]/libraries=["class", "mvec", "m"]/' setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
}
