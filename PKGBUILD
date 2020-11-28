# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=comictagger
_srctag=1.3.0-alpha.0
pkgver=${_srctag//-/.}
pkgrel=1
pkgdesc='Application for writing metadata to digital comics, written in Python and PyQt'
arch=(any)
url='https://github.com/comictagger/comictagger'
license=(Apache)
makedepends=('python-setuptools')
depends=('python'
    'python-beautifulsoup4'
    'python-natsort'
    'python-pypdf2'
    'python-pillow'
    'python-pyqt5'
    'python-unrar-cffi')
source=(git+https://github.com/comictagger/comictagger.git#tag=$_srctag)
sha256sums=('SKIP')

build() {
  cd comictagger
  python setup.py build
}

package() {
  cd comictagger
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
