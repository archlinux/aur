# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>

pkgname=genx
pkgver=3.0.6
pkgrel=1
pkgdesc="X-ray and Neutron reflectivity fitting software"
arch=("i686" "x86_64")
url="http://genx.sourceforge.net/"
license=("GPL v3")
options=(!libtool)
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-h5py" "python-wxpython" "python-appdirs")
makedepends=("cython" "git")
source=(https://master.dl.sourceforge.net/project/genx/3.x.y/GenX%203.0.x/GenX-$pkgver.tar.gz)
sha256sums=("eedcce587a2d5d31ef8d9886accf1a2741777bd64a1061232b9d039c02bd0927")

build() {
  cd "$srcdir"/GenX-"$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir"/GenX-"$pkgver"
  python setup.py install --prefix=usr/ --root=$pkgdir
  sed -i $'s/\r$//' $pkgdir/usr/bin/genx
}
