# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>

pkgname=genx
pkgver=2.4.9
pkgrel=1
pkgdesc="X-ray and Neutron reflectivity fitting software"
arch=("i686" "x86_64")
url="http://genx.sourceforge.net/"
license=("GPL v3")
options=(!libtool)
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-h5py" "wxpython-phoenix" "python-appdirs")
makedepends=("cython" "git")
source=(https://github.com/haozhangphd/genx-py3/archive/v$pkgver.tar.gz)
sha256sums=("52d760cd032492c45fa02b7c707b2af9de03c05c949dc0dced86b9aecce1ef4f")

build() {
  cd "$srcdir"/genx-py3-"$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir"/genx-py3-"$pkgver"
  python setup.py install --prefix=usr/ --root=$pkgdir
}
