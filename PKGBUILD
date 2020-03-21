# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-gym
_pkgname=gym
pkgver=0.17.1
pkgrel=1
pkgdesc="A toolkit for developing and comparing reinforcement learning algorithms."
arch=('any')
_github='openai/gym'
_pypiname='gym'
url="https://gym.openai.com/"
license=('MIT')
depends=('python' 'python-scipy' 'python-numpy' 'python-six' 'python-pyglet' 'python-cloudpickle')
optdepends=(
  'python-atari-py'
  'python-pillow'
  'python-opengl'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_github}/archive/${pkgver}.tar.gz")
md5sums=('bbd7b8ed85bf5fb951b13856ba6009dd')

build() {
  msg "Building Python 3"
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
