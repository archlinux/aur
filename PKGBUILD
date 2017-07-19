# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>

pkgname=genx
pkgver=2.4.9
pkgrel=2
pkgdesc="X-ray and Neutron reflectivity fitting software"
arch=("i686" "x86_64")
url="http://genx.sourceforge.net/"
license=("GPL v3")
options=(!libtool)
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-h5py" "wxpython-phoenix" "python-appdirs")
makedepends=("cython" "git")
source=(https://github.com/haozhangphd/genx-py3/archive/v$pkgver.tar.gz)
sha256sums=("0f9c2f98106a7f51822d91ac4f2a8e37123312e654857324bbe4d24e3f32d3eb")

build() {
  cd "$srcdir"/genx-py3-"$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir"/genx-py3-"$pkgver"
  python setup.py install --prefix=usr/ --root=$pkgdir
}
