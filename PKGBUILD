# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-atari-py
_pkgname=atari-py
pkgver=0.2.4
pkgrel=1
pkgdesc="A python interface for the Arcade Learning Environment (Modified by OpenAI)"
arch=('any')
_github='openai/atari-py'
#_pypiname='atari-py'
url="https://github.com/openai/atari-py"
license=('GPL')
depends=('python' 'python-numpy' 'python-six' 'zlib')
makedepends=('python-setuptools' 'cmake' 'gcc')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/openai/atari-py/archive/${pkgver}.tar.gz")
md5sums=('3a1a5108b27a8592619e960637da929c')

build() {
  msg "Building Python 3"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
