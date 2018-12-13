pkgname=python-atari-py
_pkgname=atari-py
pkgver=0.1.7
pkgrel=1
pkgdesc="Python bindings to Atari games"
arch=('any')
_github='openai/atari-py'
#_pypiname='atari-py'
url="https://github.com/openai/atari-py"
license=('GPL')
depends=('python' 'python-numpy' 'python-six' 'zlib')
makedepends=('python-setuptools' 'cmake' 'gcc')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/openai/atari-py/archive/${pkgver}.tar.gz")
md5sums=('0de4736dff57022538238a9d5554ef1c')

build() {
  msg "Building Python 3"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
