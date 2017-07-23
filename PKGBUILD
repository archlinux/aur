# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>

pkgname=genx
pkgver=2.4.9
pkgrel=3
pkgdesc="X-ray and Neutron reflectivity fitting software"
arch=("i686" "x86_64")
url="http://genx.sourceforge.net/"
license=("GPL v3")
options=(!libtool)
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-h5py" "wxpython-phoenix" "python-appdirs")
makedepends=("cython" "git")
source=(https://github.com/haozhangphd/genx-py3/archive/v$pkgver.tar.gz)
sha256sums=("5a0ff30248dbaf6fa10da9f0874acb402c042a0f37d228b206d7287c68cfaa5f")

build() {
  cd "$srcdir"/genx-py3-"$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir"/genx-py3-"$pkgver"
  python setup.py install --prefix=usr/ --root=$pkgdir
}
