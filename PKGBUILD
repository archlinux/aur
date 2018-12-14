pkgname=python-gym
_pkgname=gym
pkgver=0.10.9
pkgrel=1
pkgdesc="A toolkit for developing and comparing reinforcement learning algorithms."
arch=('any')
_github='openai/gym'
_pypiname='gym'
url="https://gym.openai.com/"
license=('MIT')
depends=('python' 'python-scipy' 'python-numpy' 'python-requests' 'python-pyglet')
optdepends=(
  'python-atari-py'
  'python-pillow'
  'python-opengl'
)
makedepends=('python-setuptools')
source=("https://github.com/${_github}/archive/${pkgver}.tar.gz")
md5sums=('8f12cb1e528b81b7cd01621b89d07d3e')

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
