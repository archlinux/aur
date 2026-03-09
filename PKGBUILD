# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgbase=python-class
pkgname=("python-class")  
pkgver=3.3.4
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
sha256sums=('35f2599f0eaa680d2f8198ddb7f70099df7c00a6c04f239c142cd8f3c420545c')

package() {
  cd "$srcdir/class_public-${pkgver}/"
  make  -j libclass.a
  cd python
  sed -i 's/libraries=\["class"\]/libraries=["class", "mvec", "m"]/' setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
}
