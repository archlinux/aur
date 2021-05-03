# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgbase=python-class
pkgname=("python-class")  
pkgver=3.0.1
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
depends=('cython')
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f8d6e43a9a54fb1414f2d59e23b030ce0ee81bd41cb5221d29cbbc5387ce6f38')

package() {
  cd "$srcdir/class_public-${pkgver}/"
  make  -j libclass.a
  cd python
  sed -i 's/libraries=\["class"\]/libraries=["class", "mvec", "m"]/' setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
}
