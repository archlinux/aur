# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-gym
_pkgname=gym
pkgver=0.11.0
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
md5sums=('5feba94251f0a70b91840d36a3526cbc')

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
