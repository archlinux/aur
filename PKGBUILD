# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgbase=python-class
pkgname=("python-class")  
pkgver=3.2.0
pkgrel=1
pkgdesc="CLASS: Cosmic Linear Anisotropy Solving System"
arch=(any)
url="https://github.com/lesgourg/class_public"
license=()
groups=()
provides=()
conflicts=()
replaces=()
backup=()
depends=(cython)
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('16c65189995c0569bc3053ff8bdb69fe4901abaaaba6dd88c030c17e26f1e9ba')

package() {
  cd "$srcdir/class_public-${pkgver}/"
  make  -j libclass.a
  cd python
  sed -i 's/libraries=\["class"\]/libraries=["class", "mvec", "m"]/' setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
}
