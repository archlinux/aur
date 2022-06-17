# Contributor: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-atari-py
_pkgname=atari-py
pkgver=0.2.9
pkgrel=2
pkgdesc='[DEPRECATED: use python-ale-py instead] Interface for the Arcade Learning Environment (mod by OpenAI)'
arch=('any')
_github='openai/atari-py'
#_pypiname='atari-py'
url="https://github.com/openai/atari-py"
license=('GPL')
depends=('python' 'python-numpy' 'python-six' 'zlib')
makedepends=('python-setuptools' 'cmake' 'gcc')
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/openai/atari-py/archive/${pkgver}.tar.gz")
md5sums=('0ccc01f27d5331a1156b18dea315edc1')

build() {
  msg "Building Python 3"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
